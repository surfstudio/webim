import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

import 'package:webim_sdk/src/api/webim_repository.dart';
import 'package:webim_sdk/src/domain/message_event.dart';
import 'package:webim_sdk/src/domain/chat_action.dart';
import 'package:webim_sdk/src/webim_session_push_params.dart';
import 'package:webim_sdk/src/domain/delta_response.dart';
import 'package:webim_sdk/src/domain/default_response.dart';
import 'package:webim_sdk/src/exception.dart';
import 'package:webim_sdk/src/life_cycle_repository.dart';
import 'package:webim_sdk/src/util/id_generator.dart';
import 'package:webim_sdk/src/util/server_url_parser.dart';
import 'package:webim_sdk/src/domain/webim_authorization.dart';
import 'package:webim_sdk/src/api/webim_cache.dart';
import 'package:webim_sdk/src/util/ssl_http_overrides.dart';
import 'package:webim_sdk/webim_sdk.dart';

const _pollingDuration = const Duration(seconds: 20);
final _defaultHttpHeaders = <String, dynamic>{
  'User-Agent': 'Android: Webim-Client/0.0.0-indev (sdk_gphone_x86_arm; Android 11)',
  'x-webim-sdk-version': '0.0.0-indev'
};

class WebimSession {
  WebimSession._(
    this._accountName,
    this._location,
    this._visitorFields,
    this._deviceId,
    this._platform,
    this._pushService,
    this._pushToken,
  ) {
    _init();
  }

  WebimRepository _webimRepository;

  final String _accountName;
  final String _location;
  final String _visitorFields;
  final String _deviceId;
  final String _platform;
  final String _pushService;
  final String _pushToken;

  final messageEventStream = StreamController<MessageEvent>.broadcast();

  bool _isPaused = true;
  bool _isDisposed = false;
  Timer _pollingLoopTimer;
  LifeCycleRepository _lifeCycleRepository;
  WebimCache _cache;
  int _currentSyncRevision;

  WebimAuthorization _authorization;

  static WebimSessionBuilder get builder => WebimSessionBuilder();

  List<Message> get messageThread => List.from(_cache.messageList)..sort();

  void get resume {
    _isPaused = false;

    if (_authorization == null) _login();
  }

  void get pause {
    _isPaused = true;
  }

  void get dispose {
    _isPaused = true;
    _isDisposed = true;
    _lifeCycleRepository.removeListener(_onLifeCycleEvent);
    _lifeCycleRepository.dispose();
    _pollingLoopTimer.cancel();
    messageEventStream.close();
  }

  void get isPaused => _isPaused;

  void get isDisposed => _isDisposed;

  void sendMessage(String text) {
    final message = Message(
      textValue: text,
      kind: WMMessageKind.VISITOR,
      clientSideId: IdGenerator.messageClientSideId,
      tsSeconds: (DateTime.now().millisecondsSinceEpoch / 1000).toDouble(),
    );
    final messageEvent = DeltaItem<Message>(
      objectType: DeltaItemType.CHAT_MESSAGE,
      data: message,
      event: Event.ADD,
    );
    _cache.addMessageList([messageEvent]);

    _sendAllSendingMessageFromCache();
  }

  Future<void> uploadFile(File file) async {
    await _webimRepository.uploadFile(
      file: file,
      clientSideId: IdGenerator.messageClientSideId,
      authorizationToken: _authorization.authToken,
      pageId: _authorization.pageId,
    );
  }

  void _sendAllSendingMessageFromCache() {
    _cache.sendingMessage.forEach(
      (message) => SslHttpOverrides.runSslOverridesZoned<Future<DefaultResponse>>(
        () => _webimRepository.sendMessage(
          action: ChatAction.ACTION_CHAT_MESSAGE.value,
          authorizationToken: _authorization.authToken,
          pageId: _authorization.pageId,
          clientSideId: message.clientSideId,
          message: message.textValue,
        ),
      ),
    );
  }

  void _init() async {
    _pollingLoopTimer = Timer.periodic(_pollingDuration, (_) => _pollingEvent());

    _lifeCycleRepository = LifeCycleRepository()
      ..addListener(_onLifeCycleEvent)
      ..subscribe();
    _cache = WebimCache(messageList: [], eventStream: messageEventStream);

    final url = ServerUrlParser.url(_accountName);

    final httpClient = Dio(
      BaseOptions(
        baseUrl: url,
        // headers: _defaultHttpHeaders,
      ),
    )..interceptors.addAll([
        if (kDebugMode)
          LogInterceptor(
            requestBody: true,
            responseBody: true,
          ),
      ]);

    _webimRepository = WebimRepository(httpClient);
  }

  Future<void> _login() async {
    final result = await SslHttpOverrides.runSslOverridesZoned<Future<DeltaResponse>>(
      () => _webimRepository.getLogin(
        visitorFieldsJsonString: _visitorFields,
        location: _location,
        deviceId: _deviceId,
        platform: _platform,
        pushService: _pushService,
        pushToken: _pushToken,
      ),
    );
    _authorization = WebimAuthorization.fromDeltaResponse(
      result,
      _accountName,
      _location,
      _visitorFields,
    );
    if (result == null) return;
    _currentSyncRevision = result.revision;
    if (result.fullUpdate != null) {
      _onFullUpdate(result.fullUpdate);
    }
    if (result.deltaList != null) {
      _onDeltaUpdate(result.deltaList);
    }
    _pollingEvent();
  }

  void _pollingEvent() {
    if (_isPaused || _isDisposed) return;
    if (_authorization == null) {
      _login();
      return;
    }
    _polling();
    _sendAllSendingMessageFromCache();
  }

  Future<void> _polling() async {
    final result = await SslHttpOverrides.runSslOverridesZoned<Future<DeltaResponse>>(
      () => _webimRepository.getDelta(
        since: _currentSyncRevision,
        authorizationToken: _authorization.authToken,
        pageId: _authorization.pageId,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );

    if (result.deltaList == null && result.fullUpdate == null) {
      return;
    }

    if (result.fullUpdate != null) {
      _onFullUpdate(result.fullUpdate);
    }
    if (result.deltaList != null) {
      _onDeltaUpdate(result.deltaList);
    }

    _currentSyncRevision = result.revision;
    _pollingEvent();
  }

  void _onFullUpdate(DeltaFullUpdate update) {
    if (update.chat?.messages == null) return;
    _cache.replaceWithMessageList(update.chat.messages);
  }

  void _onDeltaUpdate(List<DeltaItem> update) {
    _cache.addMessageList(update);
  }

  void _onLifeCycleEvent() {
    final state = _lifeCycleRepository.state;
    if (state == AppLifecycleState.paused) {
      this.pause;
    }
    if (state == AppLifecycleState.resumed) {
      this.resume;
    }
  }
}

/// Session builder
/// for build demo server session set:
/// ```dart
///      final builder = WebimSessionBuilder()
///          ..account('demo')
///          ..location('mobile');
///      final session = builder.build();
///      session.resume;
/// ```
///
class WebimSessionBuilder {
  String _accountName;
  String _location;
  String _visitorFields;
  String _deviceId;
  WebimSessionPushParams _pushParams;

  WebimSession build() {
    if (_location == null || _accountName == null)
      throw WebimBuilderException('Need provide account and location params at least');

    return WebimSession._(
      _accountName,
      _location,
      _visitorFields,
      _deviceId,
      _pushParams?.pushPtatform?.value,
      _pushParams?.pushService?.value,
      _pushParams?.pushToken,
    );
  }

  set account(String account) => _accountName = account;
  set location(String location) => _location = location;
  set visitorFields(String visitorFields) => _visitorFields = visitorFields;
  set deviceId(String deviceId) => _deviceId = deviceId;
  set pushParams(WebimSessionPushParams pushParams) => _pushParams = pushParams;
}
