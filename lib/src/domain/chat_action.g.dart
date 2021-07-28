// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatActionValue _$_ChatActionValueFromJson(Map<String, dynamic> json) {
  return _ChatActionValue(
    _$enumDecodeNullable(_$ChatActionEnumMap, json['action']),
  );
}

Map<String, dynamic> _$_ChatActionValueToJson(_ChatActionValue instance) =>
    <String, dynamic>{
      'action': _$ChatActionEnumMap[instance.action],
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

const _$ChatActionEnumMap = {
  ChatAction.ACTION_CHAT_CLOSE: 'chat.close',
  ChatAction.ACTION_CHAT_KEYBOARD_RESPONSE: 'chat.keyboard_response',
  ChatAction.ACTION_CHAT_READ_BY_VISITOR: 'chat.read_by_visitor',
  ChatAction.ACTION_CHAT_START: 'chat.start',
  ChatAction.ACTION_CHAT_MESSAGE: 'chat.message',
  ChatAction.ACTION_CHAT_DELETE_MESSAGE: 'chat.delete_message',
  ChatAction.ACTION_OPERATOR_RATE: 'chat.operator_rate_select',
  ChatAction.ACTION_PUSH_TOKEN_SET: 'set_push_token',
  ChatAction.ACTION_REQUEST_CALL_SENTR:
      'chat.action_request.call_sentry_action_request',
  ChatAction.ACTION_SEND_CHAT_HISTORY: 'chat.send_chat_history',
  ChatAction.ACTION_SEND_STICKER: 'sticker',
  ChatAction.ACTION_SET_PRECHAT_FIELDS: 'chat.set_prechat_fields',
  ChatAction.ACTION_VISITOR_TYPING: 'chat.visitor_typing',
  ChatAction.ACTION_WIDGET_UPDATE: 'widget.update',
  ChatAction.ACTION_SURVEY_ANSWER: 'survey.answer',
  ChatAction.ACTION_SURVEY_CANCEL: 'survey.cancel',
};
