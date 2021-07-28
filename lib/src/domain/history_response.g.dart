// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryBeforeResponse _$HistoryBeforeResponseFromJson(
    Map<String, dynamic> json) {
  return HistoryBeforeResponse(
    json['result'] as String,
    json['data'] == null
        ? null
        : HistoryResponseData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HistoryBeforeResponseToJson(
        HistoryBeforeResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

HistorySinceResponse _$HistorySinceResponseFromJson(Map<String, dynamic> json) {
  return HistorySinceResponse(
    json['result'] as String,
    json['data'] == null
        ? null
        : HistoryResponseData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HistorySinceResponseToJson(
        HistorySinceResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

HistoryResponseData _$HistoryResponseDataFromJson(Map<String, dynamic> json) {
  return HistoryResponseData(
    hasMore: json['hasMore'] as bool,
    revision: json['revision'] as String,
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HistoryResponseDataToJson(
        HistoryResponseData instance) =>
    <String, dynamic>{
      'hasMore': instance.hasMore,
      'revision': instance.revision,
      'messages': instance.messages,
    };
