import 'package:json_annotation/json_annotation.dart';
import 'package:webim_sdk/src/util/num_extension.dart';
import 'package:webim_sdk/src/exception.dart';

part 'message.g.dart';

@JsonSerializable()
class Message implements Comparable {
  @JsonKey(name: "authorId")
  final int authorId;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "canBeReplied")
  final bool canBeReplied;
  @JsonKey(name: "clientSideId")
  final String clientSideId;

  /*
    There's no need to unparse this data.
    The field exist only to pass it from an app to server and vice versa.
    But generally this field contains JSON object.
    */
  @JsonKey(name: "data")
  final MessageData data;
  @JsonKey(name: "canBeEdited")
  final bool canBeEdited;
  @JsonKey(name: "chatId")
  final String chatId;
  @JsonKey(name: "deleted")
  final bool deleted;
  @JsonKey(name: "edited")
  final bool edited;
  @JsonKey(name: "id")
  final String serverId;
  @JsonKey(name: "kind")
  final WMMessageKind kind;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "read")
  final bool read;
  @JsonKey(name: "sessionId")
  final String sessionId;
  @JsonKey(name: "text")
  final String textValue;
  @JsonKey(name: "ts")
  final int tsSeconds;
  @JsonKey(name: "modifiedTs")
  final double modified;
  @JsonKey(name: "ts_m")
  final int tsMicros;
  @JsonKey(name: "quote")
  final Quote quote;

  Message({
    this.authorId,
    this.avatar,
    this.canBeReplied,
    this.clientSideId,
    this.data,
    this.canBeEdited,
    this.chatId,
    this.deleted,
    this.edited,
    this.serverId,
    this.kind,
    this.name,
    this.read,
    this.sessionId,
    this.textValue,
    int tsSeconds,
    int tsMicros,
    this.quote,
    this.modified,
  })  : tsMicros = tsMicros ?? tsSeconds?.round()?.fromSecToMicro() ?? -1,
        tsSeconds = tsSeconds?.round() ?? tsMicros?.fromMicroToSec() ?? -1;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is Message) {
      if (other.clientSideId != null) {
        if (clientSideId != other.clientSideId) return false;
      }
      if (serverId != null && other.serverId != null && serverId == other.serverId) return true;
      return true;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => super.hashCode;

  @override
  int compareTo(other) {
    if (other is Message) {
      return tsSeconds.compareTo(other.tsSeconds);
    }
    throw WebimTypeException('other is! Message');
  }
}

extension MessageX on Message {
  DateTime get time => DateTime.fromMillisecondsSinceEpoch((tsSeconds * 1000).round());

  WebimMessageState get status =>
      serverId != null ? WebimMessageState.sent : WebimMessageState.sending;
}

@JsonSerializable()
class MessageData {
  @JsonKey(name: "file")
  final MessageFile file;

  MessageData({this.file});

  factory MessageData.fromJson(Map<String, dynamic> json) => _$MessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDataToJson(this);
}

@JsonSerializable()
class MessageFile {
  @JsonKey(name: "state")
  final FileState state;
  @JsonKey(name: "progress")
  final int progress;
  @JsonKey(name: "desc")
  final MessageFileDescription desc;

  MessageFile({
    this.state,
    this.progress,
    this.desc,
  });

  factory MessageFile.fromJson(Map<String, dynamic> json) => _$MessageFileFromJson(json);

  Map<String, dynamic> toJson() => _$MessageFileToJson(this);
}

@JsonSerializable()
class MessageFileDescription {
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "filename")
  final String filename;
  @JsonKey(name: "content_type")
  final String contentType;
  @JsonKey(name: "size")
  final int size;
  @JsonKey(name: "visitor_id")
  final String visitorId;

  MessageFileDescription({
    this.guid,
    this.filename,
    this.contentType,
    this.size,
    this.visitorId,
  });

  factory MessageFileDescription.fromJson(Map<String, dynamic> json) =>
      _$MessageFileDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$MessageFileDescriptionToJson(this);
}

enum FileState {
  @JsonValue("error")
  ERROR,
  @JsonValue("ready")
  READY,
  @JsonValue("upload")
  UPLOAD
}

@JsonSerializable()
class Quote {
  @JsonKey(name: "message")
  final QuotedMessage message;
  @JsonKey(name: "state")
  final QuoteState state;

  Quote({
    this.message,
    this.state,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}

@JsonSerializable()
class QuotedMessage {
  @JsonKey(name: "authorId")
  final String authorId;
  @JsonKey(name: "id")
  final String serverId;
  @JsonKey(name: "kind")
  final WMMessageKind kind;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "text")
  final String textValue;
  @JsonKey(name: "ts")
  final int tsSeconds;
  @JsonKey(name: "channelSideId")
  final String channelSideId;

  QuotedMessage({
    this.authorId,
    this.serverId,
    this.kind,
    this.name,
    this.textValue,
    this.tsSeconds,
    this.channelSideId,
  });

  factory QuotedMessage.fromJson(Map<String, dynamic> json) => _$QuotedMessageFromJson(json);

  Map<String, dynamic> toJson() => _$QuotedMessageToJson(this);
}

enum QuoteState {
  @JsonValue("pending")
  PENDING,
  @JsonValue("filled")
  FILLED,
  @JsonValue("not-found")
  NOT_FOUND,
}

extension QuoteStateX on QuoteState {
  String get value => _$QuoteStateEnumMap[this];
}

enum WMMessageKind {
  @JsonValue("action_request")
  ACTION_REQUEST,
  @JsonValue("cont_req")
  CONTACT_REQUEST,
  @JsonValue("contacts")
  CONTACTS,
  @JsonValue("file_operator")
  FILE_FROM_OPERATOR,
  @JsonValue("for_operator")
  FOR_OPERATOR,
  @JsonValue("file_visitor")
  FILE_FROM_VISITOR,
  @JsonValue("info")
  INFO,
  @JsonValue("keyboard")
  KEYBOARD,
  @JsonValue("keyboard_response")
  KEYBOARD_RESPONCE,
  @JsonValue("operator")
  OPERATOR,
  @JsonValue("operator_busy")
  OPERATOR_BUSY,
  @JsonValue("sticker_visitor")
  STICKER_VISITOR,
  @JsonValue("visitor")
  VISITOR,
}

extension WMMessageKindX on WMMessageKind {
  String get value => _$WMMessageKindEnumMap[this];
}

enum WebimMessageState {
  sending,
  sent,
}
