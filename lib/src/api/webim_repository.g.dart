// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webim_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _WebimRepository implements WebimRepository {
  _WebimRepository(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DeltaResponse> getLogin(
      {sdkVersion,
      event = 'init',
      required pushService,
      required pushToken,
      platform = 'flutter',
      required visitorExtJsonString,
      visitorFieldsJsonString,
      providedAuthorizationToken,
      required location,
      appVersion,
      visitSessionId,
      title = 'Android Client',
      since = 0,
      isToRespondImmediately = true,
      required deviceId,
      prechatFields}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'event': event,
      r'push-service': pushService,
      r'push-token': pushToken,
      r'platform': platform,
      r'visitor-ext': visitorExtJsonString,
      r'visitor': visitorFieldsJsonString,
      r'provided_auth_token': providedAuthorizationToken,
      r'location': location,
      r'app-version': appVersion,
      r'visit-session-id': visitSessionId,
      r'title': title,
      r'since': since,
      r'respond-immediately': isToRespondImmediately,
      r'device-id': deviceId,
      r'prechat-key-independent-fields': prechatFields
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'x-webim-sdk-version': sdkVersion};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<DeltaResponse>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/l/v/m/delta', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeltaResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeltaResponse> getDelta(
      {required since, required pageId, required authorizationToken, required timestamp}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'since': since,
      r'page-id': pageId,
      r'auth-token': authorizationToken,
      r'ts': timestamp
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<DeltaResponse>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/l/v/m/delta', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeltaResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DefaultResponse> sendMessage(
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
    final _headers = <String, dynamic>{};
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
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<DefaultResponse>(Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, '/l/v/m/action', queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DefaultResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DefaultResponse> setChatRead(
      {action, required pageId, required authorizationToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {'action': action, 'page-id': pageId, 'auth-token': authorizationToken};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<DefaultResponse>(Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, '/l/v/m/action', queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DefaultResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryResponse> getHistory(pageId, authorizationToken, {before, since}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page-id': pageId,
      r'auth-token': authorizationToken,
      r'before-ts': before,
      r'since': since
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<HistoryResponse>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/l/v/m/history', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> _uploadFileUnparse({required data}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = data;
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/l/v/m/upload', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
