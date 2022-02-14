import 'package:json_annotation/json_annotation.dart';

part 'chat_action.g.dart';

enum ChatAction {
  @JsonValue("chat.close")
  ACTION_CHAT_CLOSE,
  @JsonValue("chat.keyboard_response")
  ACTION_CHAT_KEYBOARD_RESPONSE,
  @JsonValue("chat.read_by_visitor")
  ACTION_CHAT_READ_BY_VISITOR,
  @JsonValue("chat.start")
  ACTION_CHAT_START,
  @JsonValue("chat.message")
  ACTION_CHAT_MESSAGE,
  @JsonValue("chat.delete_message")
  ACTION_CHAT_DELETE_MESSAGE,
  @JsonValue("chat.operator_rate_select")
  ACTION_OPERATOR_RATE,
  @JsonValue("set_push_token")
  ACTION_PUSH_TOKEN_SET,
  @JsonValue("chat.action_request.call_sentry_action_request")
  ACTION_REQUEST_CALL_SENTR,
  @JsonValue("chat.send_chat_history")
  ACTION_SEND_CHAT_HISTORY,
  @JsonValue("sticker")
  ACTION_SEND_STICKER,
  @JsonValue("chat.set_prechat_fields")
  ACTION_SET_PRECHAT_FIELDS,
  @JsonValue("chat.visitor_typing")
  ACTION_VISITOR_TYPING,
  @JsonValue("widget.update")
  ACTION_WIDGET_UPDATE,
  @JsonValue("survey.answer")
  ACTION_SURVEY_ANSWER,
  @JsonValue("survey.cancel")
  ACTION_SURVEY_CANCEL,
}

extension ChatActionX on ChatAction {
  String? get value => _$ChatActionEnumMap[this];
}

/// Support serializable class
@JsonSerializable()
class _ChatActionValue {
  final ChatAction action;

  _ChatActionValue(this.action);
}
