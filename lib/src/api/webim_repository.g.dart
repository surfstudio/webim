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
  getHistory(pageId, authorizationToken, {before, since}) async {
    ArgumentError.checkNotNull(pageId, 'pageId');
    ArgumentError.checkNotNull(authorizationToken, 'authorizationToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'page-id': pageId,
      'auth-token': authorizationToken,
      'before-ts': before,
      'since': since
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/l/v/m/history',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = HistoryResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  _uploadFileUnparse({data}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = data;
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
