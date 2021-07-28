import 'package:json_annotation/json_annotation.dart';
import 'package:webim_sdk/src/domain/message.dart';


part 'history_response.g.dart';

@JsonSerializable()
class HistoryBeforeResponse {
  @JsonKey(name: "result")
  final String result;
  @JsonKey(name: "data")
  final HistoryResponseData data;

  HistoryBeforeResponse(this.result, this.data);

  factory HistoryBeforeResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryBeforeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryBeforeResponseToJson(this);
}

@JsonSerializable()
class HistorySinceResponse {
  @JsonKey(name: "result")
  final String result;
  @JsonKey(name: "data")
  final HistoryResponseData data;

  HistorySinceResponse(this.result, this.data);

  factory HistorySinceResponse.fromJson(Map<String, dynamic> json) =>
      _$HistorySinceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistorySinceResponseToJson(this);
}

@JsonSerializable()
class HistoryResponseData {
  @JsonKey(name: 'hasMore')
  final bool hasMore;
  @JsonKey(name: 'revision')
  final String revision;
  @JsonKey(name: "messages")
  final List<Message> messages;

  HistoryResponseData({
    this.hasMore,
    this.revision,
    this.messages,
  });

  factory HistoryResponseData.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseDataToJson(this);
}
