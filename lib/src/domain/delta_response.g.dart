// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeltaResponse _$DeltaResponseFromJson(Map<String, dynamic> json) {
  return DeltaResponse(
    json['revision'] as int,
    json['fullUpdate'] == null
        ? null
        : DeltaFullUpdate.fromJson(json['fullUpdate'] as Map<String, dynamic>),
    (json['deltaList'] as List)
        ?.map((e) =>
            e == null ? null : DeltaItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DeltaResponseToJson(DeltaResponse instance) =>
    <String, dynamic>{
      'revision': instance.revision,
      'fullUpdate': instance.fullUpdate,
      'deltaList': instance.deltaList,
    };

DeltaFullUpdate _$DeltaFullUpdateFromJson(Map<String, dynamic> json) {
  return DeltaFullUpdate(
    authToken: json['authToken'] as String,
    hintsEnabled: json['hintsEnabled'] as bool,
    historyRevision: json['historyRevision'] as String,
    onlineStatus: json['onlineStatus'] as String,
    pageId: json['pageId'] as String,
    state: json['state'] as String,
    visitorJson: json['visitorJson'] as String,
    visitSessionId: json['visitSessionId'] as String,
    showHelloMessage: json['showHelloMessage'] as bool,
    chatStartAfterMessage: json['chatStartAfterMessage'] as bool,
    helloMessageDescr: json['helloMessageDescr'] as String,
    chat: json['chat'] == null
        ? null
        : ChatItem.fromJson(json['chat'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeltaFullUpdateToJson(DeltaFullUpdate instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'chat': instance.chat,
      'hintsEnabled': instance.hintsEnabled,
      'historyRevision': instance.historyRevision,
      'onlineStatus': instance.onlineStatus,
      'pageId': instance.pageId,
      'state': instance.state,
      'visitorJson': instance.visitorJson,
      'visitSessionId': instance.visitSessionId,
      'showHelloMessage': instance.showHelloMessage,
      'chatStartAfterMessage': instance.chatStartAfterMessage,
      'helloMessageDescr': instance.helloMessageDescr,
    };

ChatItem _$ChatItemFromJson(Map<String, dynamic> json) {
  return ChatItem(
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ChatItemToJson(ChatItem instance) => <String, dynamic>{
      'messages': instance.messages,
    };

DeltaItem<T> _$DeltaItemFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return DeltaItem<T>(
    objectType:
        _$enumDecodeNullable(_$DeltaItemTypeEnumMap, json['objectType']),
    event: _$enumDecodeNullable(_$EventEnumMap, json['event']),
    id: json['id'] as String,
    data: fromJsonT(json['data']),
  );
}

Map<String, dynamic> _$DeltaItemToJson<T>(
  DeltaItem<T> instance,
  Object Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'objectType': _$DeltaItemTypeEnumMap[instance.objectType],
      'event': _$EventEnumMap[instance.event],
      'id': instance.id,
      'data': toJsonT(instance.data),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DeltaItemTypeEnumMap = {
  DeltaItemType.CHAT: 'CHAT',
  DeltaItemType.POLLING_PERIOD: 'POLLING_PERIOD',
  DeltaItemType.VISITOR: 'VISITOR',
  DeltaItemType.VISITOR_FULL: 'VISITOR_FULL',
  DeltaItemType.CHAT_MESSAGE: 'CHAT_MESSAGE',
  DeltaItemType.CHAT_OPERATOR: 'CHAT_OPERATOR',
  DeltaItemType.DEPARTMENT_LIST: 'DEPARTMENT_LIST',
  DeltaItemType.HISTORY_REVISION: 'HISTORY_REVISION',
  DeltaItemType.OPERATOR_RATE: 'OPERATOR_RATE',
  DeltaItemType.CHAT_OPERATOR_TYPING: 'CHAT_OPERATOR_TYPING',
  DeltaItemType.CHAT_READ_BY_VISITOR: 'CHAT_READ_BY_VISITOR',
  DeltaItemType.CHAT_STATE: 'CHAT_STATE',
  DeltaItemType.CHAT_UNREAD_BY_OPERATOR_SINCE_TIMESTAMP:
      'CHAT_UNREAD_BY_OPERATOR_SINCE_TS',
  DeltaItemType.OFFLINE_CHAT_MESSAGE: 'OFFLINE_CHAT_MESSAGE',
  DeltaItemType.UNREAD_BY_VISITOR: 'UNREAD_BY_VISITOR',
  DeltaItemType.VISIT_SESSION: 'VISIT_SESSION',
  DeltaItemType.VISIT_SESSION_STATE: 'VISIT_SESSION_STATE',
  DeltaItemType.READ_MESSAGE: 'MESSAGE_READ',
  DeltaItemType.SURVEY: 'SURVEY',
};

const _$EventEnumMap = {
  Event.ADD: 'add',
  Event.DELETE: 'del',
  Event.UPDATE: 'upd',
};
