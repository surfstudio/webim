// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    authorId: json['authorId'] as int,
    avatar: json['avatar'] as String,
    canBeReplied: json['canBeReplied'] as bool,
    clientSideId: json['clientSideId'] as String,
    data: json['data'] == null
        ? null
        : MessageData.fromJson(json['data'] as Map<String, dynamic>),
    canBeEdited: json['canBeEdited'] as bool,
    chatId: json['chatId'] as String,
    deleted: json['deleted'] as bool,
    edited: json['edited'] as bool,
    serverId: json['id'] as String,
    kind: _$enumDecodeNullable(_$WMMessageKindEnumMap, json['kind']),
    name: json['name'] as String,
    read: json['read'] as bool,
    sessionId: json['sessionId'] as String,
    textValue: json['text'] as String,
    tsSeconds: (json['ts'] as num)?.toDouble()?.round(),
    tsMicros: (json['ts_m'] as num)?.toInt(),
    quote: json['quote'] == null
        ? null
        : Quote.fromJson(json['quote'] as Map<String, dynamic>),
    modified: (json['modifiedTs'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'authorId': instance.authorId,
      'avatar': instance.avatar,
      'canBeReplied': instance.canBeReplied,
      'clientSideId': instance.clientSideId,
      'data': instance.data,
      'canBeEdited': instance.canBeEdited,
      'chatId': instance.chatId,
      'deleted': instance.deleted,
      'edited': instance.edited,
      'id': instance.serverId,
      'kind': _$WMMessageKindEnumMap[instance.kind],
      'name': instance.name,
      'read': instance.read,
      'sessionId': instance.sessionId,
      'text': instance.textValue,
      'ts': instance.tsSeconds,
      'modifiedTs': instance.modified,
      'ts_m': instance.tsMicros,
      'quote': instance.quote,
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

const _$WMMessageKindEnumMap = {
  WMMessageKind.ACTION_REQUEST: 'action_request',
  WMMessageKind.CONTACT_REQUEST: 'cont_req',
  WMMessageKind.CONTACTS: 'contacts',
  WMMessageKind.FILE_FROM_OPERATOR: 'file_operator',
  WMMessageKind.FOR_OPERATOR: 'for_operator',
  WMMessageKind.FILE_FROM_VISITOR: 'file_visitor',
  WMMessageKind.INFO: 'info',
  WMMessageKind.KEYBOARD: 'keyboard',
  WMMessageKind.KEYBOARD_RESPONCE: 'keyboard_response',
  WMMessageKind.OPERATOR: 'operator',
  WMMessageKind.OPERATOR_BUSY: 'operator_busy',
  WMMessageKind.STICKER_VISITOR: 'sticker_visitor',
  WMMessageKind.VISITOR: 'visitor',
};

MessageData _$MessageDataFromJson(Map<String, dynamic> json) {
  return MessageData(
    file: json['file'] == null
        ? null
        : MessageFile.fromJson(json['file'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageDataToJson(MessageData instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

MessageFile _$MessageFileFromJson(Map<String, dynamic> json) {
  return MessageFile(
    state: _$enumDecodeNullable(_$FileStateEnumMap, json['state']),
    progress: json['progress'] as int,
    desc: json['desc'] == null
        ? null
        : MessageFileDescription.fromJson(json['desc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageFileToJson(MessageFile instance) =>
    <String, dynamic>{
      'state': _$FileStateEnumMap[instance.state],
      'progress': instance.progress,
      'desc': instance.desc,
    };

const _$FileStateEnumMap = {
  FileState.ERROR: 'error',
  FileState.READY: 'ready',
  FileState.UPLOAD: 'upload',
};

MessageFileDescription _$MessageFileDescriptionFromJson(
    Map<String, dynamic> json) {
  return MessageFileDescription(
    guid: json['guid'] as String,
    filename: json['filename'] as String,
    contentType: json['content_type'] as String,
    size: json['size'] as int,
    visitorId: json['visitor_id'] as String,
  );
}

Map<String, dynamic> _$MessageFileDescriptionToJson(
        MessageFileDescription instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'filename': instance.filename,
      'content_type': instance.contentType,
      'size': instance.size,
      'visitor_id': instance.visitorId,
    };

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return Quote(
    message: json['message'] == null
        ? null
        : QuotedMessage.fromJson(json['message'] as Map<String, dynamic>),
    state: _$enumDecodeNullable(_$QuoteStateEnumMap, json['state']),
  );
}

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'message': instance.message,
      'state': _$QuoteStateEnumMap[instance.state],
    };

const _$QuoteStateEnumMap = {
  QuoteState.PENDING: 'pending',
  QuoteState.FILLED: 'filled',
  QuoteState.NOT_FOUND: 'not-found',
};

QuotedMessage _$QuotedMessageFromJson(Map<String, dynamic> json) {
  return QuotedMessage(
    authorId: json['authorId'] as String,
    serverId: json['id'] as String,
    kind: _$enumDecodeNullable(_$WMMessageKindEnumMap, json['kind']),
    name: json['name'] as String,
    textValue: json['text'] as String,
    tsSeconds: json['ts'] as int,
    channelSideId: json['channelSideId'] as String,
  );
}

Map<String, dynamic> _$QuotedMessageToJson(QuotedMessage instance) =>
    <String, dynamic>{
      'authorId': instance.authorId,
      'id': instance.serverId,
      'kind': _$WMMessageKindEnumMap[instance.kind],
      'name': instance.name,
      'text': instance.textValue,
      'ts': instance.tsSeconds,
      'channelSideId': instance.channelSideId,
    };
