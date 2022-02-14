// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeltaResponse _$DeltaResponseFromJson(Map<String, dynamic> json) => DeltaResponse(
      json['revision'] as int,
      DeltaFullUpdate.fromJson(json['fullUpdate'] as Map<String, dynamic>),
      (json['deltaList'] as List<dynamic>)
          .map((e) => DeltaItem<dynamic>.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeltaResponseToJson(DeltaResponse instance) => <String, dynamic>{
      'revision': instance.revision,
      'fullUpdate': instance.fullUpdate,
      'deltaList': instance.deltaList,
    };

DeltaFullUpdate _$DeltaFullUpdateFromJson(Map<String, dynamic> json) => DeltaFullUpdate(
      authToken: json['authToken'] as String,
      hintsEnabled: json['hintsEnabled'] as bool?,
      historyRevision: json['historyRevision'] as String?,
      onlineStatus: json['onlineStatus'] as String?,
      pageId: json['pageId'] as String,
      state: json['state'] as String?,
      visitorJson: json['visitorJson'] as String?,
      visitSessionId: json['visitSessionId'] as String?,
      showHelloMessage: json['showHelloMessage'] as bool?,
      chatStartAfterMessage: json['chatStartAfterMessage'] as bool?,
      helloMessageDescr: json['helloMessageDescr'] as String?,
      chat: json['chat'] == null ? null : ChatItem.fromJson(json['chat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeltaFullUpdateToJson(DeltaFullUpdate instance) => <String, dynamic>{
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

ChatItem _$ChatItemFromJson(Map<String, dynamic> json) => ChatItem(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatItemToJson(ChatItem instance) => <String, dynamic>{
      'messages': instance.messages,
    };

DeltaItem<T> _$DeltaItemFromJson<T>(
  Map<String, dynamic> json,
  T? Function(Object? json) fromJsonT,
) =>
    DeltaItem<T>(
      objectType: $enumDecodeNullable(_$DeltaItemTypeEnumMap, json['objectType']),
      event: $enumDecodeNullable(_$EventEnumMap, json['event']),
      id: json['id'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$DeltaItemToJson<T>(
  DeltaItem<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'objectType': _$DeltaItemTypeEnumMap[instance.objectType],
      'event': _$EventEnumMap[instance.event],
      'id': instance.id,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

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
  DeltaItemType.CHAT_UNREAD_BY_OPERATOR_SINCE_TIMESTAMP: 'CHAT_UNREAD_BY_OPERATOR_SINCE_TS',
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

T? _$nullableGenericFromJson<T>(
  Object? input,
  T? Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
