import 'package:json_annotation/json_annotation.dart';
import 'package:webim_sdk/src/domain/message.dart';

part 'delta_response.g.dart';

@JsonSerializable()
class DeltaResponse extends ErrorResponse {
  @JsonKey(name: "revision")
  final int revision;
  @JsonKey(name: "fullUpdate")
  final DeltaFullUpdate fullUpdate;
  @JsonKey(name: "deltaList")
  final List<DeltaItem> deltaList;

  DeltaResponse(
    this.revision,
    this.fullUpdate,
    this.deltaList,
  );

  factory DeltaResponse.fromJson(Map<String, dynamic> json) => _$DeltaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeltaResponseToJson(this);
}

class ErrorResponse {}

@JsonSerializable()
class DeltaFullUpdate {
  @JsonKey(name: "authToken")
  final String authToken;

  @JsonKey(name: "chat")
  final ChatItem? chat;

  /// Not include MVP
  // @JsonKey(name: "departments")
  // final List<DepartmentItem> departments;

  @JsonKey(name: "hintsEnabled")
  final bool? hintsEnabled;
  @JsonKey(name: "historyRevision")
  final String? historyRevision;
  @JsonKey(name: "onlineStatus")
  final String? onlineStatus;
  @JsonKey(name: "pageId")
  final String pageId;
  @JsonKey(name: "state")
  final String? state; // WMInvitationState
  final String? visitorJson; // Manual deserialization "visitor"
  @JsonKey(name: "visitSessionId")
  final String? visitSessionId;
  @JsonKey(name: "showHelloMessage")
  final bool? showHelloMessage;
  @JsonKey(name: "chatStartAfterMessage")
  final bool? chatStartAfterMessage;
  @JsonKey(name: "helloMessageDescr")
  final String? helloMessageDescr;

  /// Not include MVP
  // @JsonKey(name: "survey")
  // final SurveyItem survey;

  DeltaFullUpdate({
    required this.authToken,
    this.hintsEnabled,
    this.historyRevision,
    this.onlineStatus,
    required this.pageId,
    this.state,
    this.visitorJson,
    this.visitSessionId,
    this.showHelloMessage,
    this.chatStartAfterMessage,
    this.helloMessageDescr,
    this.chat,
  });

  factory DeltaFullUpdate.fromJson(Map<String, dynamic> json) => _$DeltaFullUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$DeltaFullUpdateToJson(this);
}

@JsonSerializable()
class ChatItem {
  @JsonKey(name: "messages")
  final List<Message>? messages;

  ChatItem({this.messages});

  factory ChatItem.fromJson(Map<String, dynamic> json) => _$ChatItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChatItemToJson(this);
}

@JsonSerializable()
class DeltaItem<T> {
  @JsonKey(name: "objectType")
  final DeltaItemType? objectType;
  @JsonKey(name: "event")
  final Event? event;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "data")
  final T? data;

  DeltaItem({
    this.objectType,
    this.event,
    this.id,
    this.data,
  });

  factory DeltaItem.fromJson(Map<String, dynamic> json) => _$DeltaItemFromJson(json, _dataFromJson);

  Map<String, dynamic> toJson() => _$DeltaItemToJson(this, _dataToJson);

  static T? _dataFromJson<T>(Object? json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('text') && json.containsKey('clientSideId')) {
        return Message.fromJson(json) as T;
      }
    }
    return null;
  }

  static Object? _dataToJson<T>(T data) {
    try {
      return (data as Message).toJson();
    } catch (_) {
      return null;
    }
  }
}

enum DeltaItemType {
  @JsonValue("CHAT")
  CHAT,
  @JsonValue("POLLING_PERIOD")
  POLLING_PERIOD,
  @JsonValue("VISITOR")
  VISITOR,
  @JsonValue("VISITOR_FULL")
  VISITOR_FULL,
  @JsonValue("CHAT_MESSAGE")
  CHAT_MESSAGE,
  @JsonValue("CHAT_OPERATOR")
  CHAT_OPERATOR,
  @JsonValue("DEPARTMENT_LIST")
  DEPARTMENT_LIST,
  @JsonValue("HISTORY_REVISION")
  HISTORY_REVISION,
  @JsonValue("OPERATOR_RATE")
  OPERATOR_RATE,
  @JsonValue("CHAT_OPERATOR_TYPING")
  CHAT_OPERATOR_TYPING,
  @JsonValue("CHAT_READ_BY_VISITOR")
  CHAT_READ_BY_VISITOR,
  @JsonValue("CHAT_STATE")
  CHAT_STATE,
  @JsonValue("CHAT_UNREAD_BY_OPERATOR_SINCE_TS")
  CHAT_UNREAD_BY_OPERATOR_SINCE_TIMESTAMP,
  @JsonValue("OFFLINE_CHAT_MESSAGE")
  OFFLINE_CHAT_MESSAGE,
  @JsonValue("UNREAD_BY_VISITOR")
  UNREAD_BY_VISITOR,
  @JsonValue("VISIT_SESSION")
  VISIT_SESSION,
  @JsonValue("VISIT_SESSION_STATE")
  VISIT_SESSION_STATE,
  @JsonValue("MESSAGE_READ")
  READ_MESSAGE,
  @JsonValue("SURVEY")
  SURVEY
}

enum Event {
  @JsonValue("add")
  ADD,
  @JsonValue("del")
  DELETE,
  @JsonValue("upd")
  UPDATE
}
