import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/retrofit.dart';

import 'package:webim_sdk/src/domain/delta_response.dart';
import 'package:webim_sdk/src/domain/history_response.dart';
import 'package:webim_sdk/src/domain/default_response.dart';
import 'package:webim_sdk/src/domain/upload_response.dart';
import 'package:webim_sdk/src/exception.dart';

part 'webim_repository.g.dart';

const _fileContentType = {
  'png': 'image/png',
  'jpg': 'image/jpeg',
  'jpeg': 'image/jpeg',
  'doc': 'application/msword',
  'rtf': 'application/rtf',
  'gif': 'image/gif',
  'txt': 'text/plain',
  'pdf': 'application/pdf',
  'docx': 'application/msword',
  'webp': 'image/webp',
  'ogg': 'audio/ogg',
};

const _maxFileSize = 10 * 1024 * 1024;

@RestApi()
abstract class WebimRepository {
  static const String PARAMETER_ACTION = "action",
      PARAMETER_APP_VERSION = "app-version",
      PARAMETER_AUTHORIZATION_TOKEN = "auth-token",
      PARAMETER_BUTTON_ID = "button-id",
      PARAMETER_CHAT_DEPARTMENT_KEY = "department-key",
      PARAMETER_CHAT_FIRST_QUESTION = "first-question",
      PARAMETER_CHAT_FORCE_ONLINE = "force-online",
      PARAMETER_CHAT_MODE = "chat-mode",
      PARAMETER_CLIENT_SIDE_ID = "client-side-id",
      PARAMETER_CUSTOM_FIELDS = "custom_fields",
      PARAMETER_DATA = "data",
      PARAMETER_DEVICE_ID = "device-id",
      PARAMETER_EMAIL = "email",
      PARAMETER_EVENT = "event",
      PARAMETER_FILE_UPLOAD = "webim_upload_file",
      PARAMETER_GUID = "guid",
      PARAMETER_LOCATION = "location",
      PARAMETER_KIND = "kind",
      PARAMETER_MESSAGE = "message",
      PARAMETER_MESSAGE_DRAFT = "message-draft",
      PARAMETER_MESSAGE_DRAFT_DELETE = "del-message-draft",
      PARAMETER_MESSAGE_HINT_QUESTION = "hint_question",
      PARAMETER_OPERATOR_ID = "operator_id",
      PARAMETER_OPERATOR_RATING = "rate",
      PARAMETER_PAGE_ID = "page-id",
      PARAMETER_PLATFORM = "platform",
      PARAMETER_QUERY = "query",
      PARAMETER_QUOTE = "quote",
      PARAMETER_PRECHAT_KEY_INDEPENDENT_FIELDS = "prechat-key-independent-fields",
      PARAMETER_PROVIDED_AUTHORIZATION_TOKEN = "provided_auth_token",
      PARAMETER_PUSH_SERVICE = "push-service",
      PARAMETER_PUSH_TOKEN = "push-token",
      PARAMETER_RESPOND_IMMEDIATELY = "respond-immediately",
      PARAMETER_REQUEST_MESSAGE_ID = "request-message-id",
      PARAMETER_SDK_VERSION = "x-webim-sdk-version",
      PARAMETER_SINCE = "since",
      PARAMETER_STICKER = "sticker-id",
      PARAMETER_SURVEY_ANSWER = "answer",
      PARAMETER_SURVEY_FORM_ID = "form-id",
      PARAMETER_SURVEY_QUESTION_ID = "question-id",
      PARAMETER_SURVEY_ID = "survey-id",
      PARAMETER_TIMESTAMP = "ts",
      PARAMETER_TIMESTAMP_BEFORE = "before-ts",
      PARAMETER_TITLE = "title",
      PARAMETER_VISIT_SESSION_ID = "visit-session-id",
      PARAMETER_VISITOR_EXT = "visitor-ext",
      PARAMETER_VISITOR_FIELDS = "visitor",
      PARAMETER_VISITOR_NOTE = "visitor_note",
      PARAMETER_VISITOR_TYPING = "typing",
      URL_SUFFIX_ACTION = "/l/v/m/action",
      URL_SUFFIX_DELTA = "/l/v/m/delta",
      URL_SUFFIX_FILE_DELETE = "l/v/file-delete",
      URL_SUFFIX_FILE_UPLOAD = "/l/v/m/upload",
      URL_SUFFIX_HISTORY = "/l/v/m/history",
      URL_SUFFIX_SEARCH_MESSAGES = "/l/v/m/search-messages",
      URL_GET_ONLINE_STATUS = "l/v/get-online-status";

  factory WebimRepository(Dio dio, {String baseUrl}) = _WebimRepository;

  @GET(URL_SUFFIX_DELTA)
  Future<DeltaResponse> getLogin({
    @Header(PARAMETER_SDK_VERSION) String sdkVersion,
    @Query(PARAMETER_EVENT) String event = 'init',
    @Query(PARAMETER_PUSH_SERVICE) String pushService,
    @Query(PARAMETER_PUSH_TOKEN) String pushToken,
    @Query(PARAMETER_PLATFORM) String platform = 'flutter',
    @Query(PARAMETER_VISITOR_EXT) String visitorExtJsonString,
    @Query(PARAMETER_VISITOR_FIELDS) String visitorFieldsJsonString,
    @Query(PARAMETER_PROVIDED_AUTHORIZATION_TOKEN) String providedAuthorizationToken,
    @Query(PARAMETER_LOCATION) String location,
    @Query(PARAMETER_APP_VERSION) String appVersion,
    @Query(PARAMETER_VISIT_SESSION_ID) String visitSessionId,
    @Query(PARAMETER_TITLE) String title = 'Android Client',
    @Query(PARAMETER_SINCE) int since = 0,
    @Query(PARAMETER_RESPOND_IMMEDIATELY) bool isToRespondImmediately = true,
    @Query(PARAMETER_DEVICE_ID) String deviceId,
    @Query(PARAMETER_PRECHAT_KEY_INDEPENDENT_FIELDS) String prechatFields,
  });

  @GET(URL_SUFFIX_DELTA)
  Future<DeltaResponse> getDelta({
    @Query(PARAMETER_SINCE) int since,
    @Query(PARAMETER_PAGE_ID) String pageId,
    @Query(PARAMETER_AUTHORIZATION_TOKEN) String authorizationToken,
    @Query(PARAMETER_TIMESTAMP) int timestamp,
  });

  /// action = [ChatAction.ACTION_CHAT_MESSAGE]
  @POST(URL_SUFFIX_ACTION)
  @FormUrlEncoded()
  Future<DefaultResponse> sendMessage({
    @Field(PARAMETER_ACTION) String action,
    @Field(PARAMETER_MESSAGE) String message,
    @Field(PARAMETER_KIND) String kind,
    @Field(PARAMETER_CLIENT_SIDE_ID) String clientSideId,
    @Field(PARAMETER_PAGE_ID) String pageId,
    @Field(PARAMETER_AUTHORIZATION_TOKEN) String authorizationToken,
    @Field(PARAMETER_MESSAGE_HINT_QUESTION) bool isHintQuestion,
    @Field(PARAMETER_DATA) String dataJsonString,
  });

  /// action = [ChatAction.ACTION_CHAT_READ_BY_VISITOR]
  @POST(URL_SUFFIX_ACTION)
  @FormUrlEncoded()
  Future<DefaultResponse> setChatRead({
    @Field(PARAMETER_ACTION) String action,
    @Field(PARAMETER_PAGE_ID) String pageId,
    @Field(PARAMETER_AUTHORIZATION_TOKEN) String authorizationToken,
  });

  @GET(URL_SUFFIX_HISTORY)
  Future<HistoryBeforeResponse> getHistoryBefore(
      @Query(PARAMETER_PAGE_ID) String pageId,
      @Query(PARAMETER_AUTHORIZATION_TOKEN) String authorizationToken,
      @Query(PARAMETER_TIMESTAMP_BEFORE) int timestampBefore // ms
      );

  /// Since is time in microseconds as string
  @GET(URL_SUFFIX_HISTORY)
  Future<HistorySinceResponse> getHistorySince(
      @Query(PARAMETER_PAGE_ID) String pageId,
      @Query(PARAMETER_AUTHORIZATION_TOKEN) String authorizationToken,
      @Query(PARAMETER_SINCE) String since //microseconds
      );

  @POST(URL_SUFFIX_FILE_UPLOAD)
  Future<String> _uploadFileUnparse({@Body() FormData data});
}

extension WebimrepositoryParserExtention on WebimRepository {
  Future<UploadResponse> uploadFile({
    @required File file,
    @required String clientSideId,
    @required String pageId,
    @required String authorizationToken,
    String chatMode = 'online',
  }) {
    final _data = FormData();
    final filename = file?.path?.split('/')?.last;
    final contentType = _fileContentType[filename?.split('.')?.last];
    if (filename == null || contentType == null) {
      throw WebimFileTypeException(
          'Filetype not allowed. Allowed type list: png, jpg, jpeg, doc, rtf, gif, txt, pdf, docx, webp, ogg');
    }
    final fileSize = file.lengthSync();
    if (fileSize > _maxFileSize)
      throw WebimFileTypeException('Filetype too large. Max file size 10 MB.');
    if (file != null) {
      _data.files.add(
        MapEntry(
          'webim_upload_file',
          MultipartFile.fromFileSync(
            file.path,
            filename: filename,
            contentType: MediaType.parse(contentType),
          ),
        ),
      );
    }
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

    return _uploadFileUnparse(data: _data)
        .then((json) => UploadResponse.fromJson(jsonDecode(json)));
  }
}
