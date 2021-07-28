// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webim_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WebimRepository implements WebimRepository {
  _WebimRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  getLogin(
      {sdkVersion,
      event = 'init',
      pushService,
      pushToken,
      platform = 'flutter',
      visitorExtJsonString,
      visitorFieldsJsonString,
      providedAuthorizationToken,
      location,
      appVersion,
      visitSessionId,
      title = 'Android Client',
      since = 0,
      isToRespondImmediately = true,
      deviceId,
      prechatFields}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'event': event,
      'push-service': pushService,
      'push-token': pushToken,
      'platform': platform,
      'visitor-ext': visitorExtJsonString,
      'visitor': visitorFieldsJsonString,
      'provided_auth_token': providedAuthorizationToken,
      'location': location,
      'app-version': appVersion,
      'visit-session-id': visitSessionId,
      'title': title,
      'since': since,
      'respond-immediately': isToRespondImmediately,
      'device-id': deviceId,
      'prechat-key-independent-fields': prechatFields
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/l/v/m/delta',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{'x-webim-sdk-version': sdkVersion},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DeltaResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getDelta({since, pageId, authorizationToken, timestamp}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'since': since,
      'page-id': pageId,
      'auth-token': authorizationToken,
      'ts': timestamp
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/l/v/m/delta',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DeltaResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  sendMessage(
      {action,
      message,
      kind,
      clientSideId,
      pageId,
      authorizationToken,
      isHintQuestion,
      dataJsonString}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {
      'action': action,
      'message': message,
      'kind': kind,
      'client-side-id': clientSideId,
      'page-id': pageId,
      'auth-token': authorizationToken,
      'hint_question': isHintQuestion,
      'data': dataJsonString
    };
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/l/v/m/action',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = DefaultResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  setChatRead({action, pageId, authorizationToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {
      'action': action,
      'page-id': pageId,
      'auth-token': authorizationToken
    };
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/l/v/m/action',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = DefaultResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getHistoryBefore(pageId, authorizationToken, timestampBefore) async {
    ArgumentError.checkNotNull(pageId, 'pageId');
    ArgumentError.checkNotNull(authorizationToken, 'authorizationToken');
    ArgumentError.checkNotNull(timestampBefore, 'timestampBefore');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'page-id': pageId,
      'auth-token': authorizationToken,
      'before-ts': timestampBefore
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/l/v/m/history',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = HistoryBeforeResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getHistorySince(pageId, authorizationToken, since) async {
    ArgumentError.checkNotNull(pageId, 'pageId');
    ArgumentError.checkNotNull(authorizationToken, 'authorizationToken');
    ArgumentError.checkNotNull(since, 'since');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'page-id': pageId,
      'auth-token': authorizationToken,
      'since': since
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/l/v/m/history',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = HistorySinceResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  _uploadFileUnparse(
      file, chatMode, clientSideId, pageId, authorizationToken) async {
    ArgumentError.checkNotNull(file, 'file');
    ArgumentError.checkNotNull(chatMode, 'chatMode');
    ArgumentError.checkNotNull(clientSideId, 'clientSideId');
    ArgumentError.checkNotNull(pageId, 'pageId');
    ArgumentError.checkNotNull(authorizationToken, 'authorizationToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'webim_upload_file',
        MultipartFile.fromFileSync(file.path,
            filename: 'image.jpeg',
            contentType: MediaType.parse('image/jpeg'))));
    if (chatMode != null) {
      _data.fields.add(MapEntry('chat-mode', chatMode));
    }
    if (clientSideId != null) {
      _data.fields.add(MapEntry('client-side-id', clientSideId));
    }
    if (pageId != null) {
      _data.fields.add(MapEntry('page-id', pageId));
    }
    if (authorizationToken != null) {
      _data.fields.add(MapEntry('auth-token', authorizationToken));
    }
    final Response<String> _result = await _dio.request('/l/v/m/upload',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return Future.value(value);
  }
}
