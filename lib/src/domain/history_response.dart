import 'package:json_annotation/json_annotation.dart';
import 'package:webim_sdk/src/domain/message.dart';

part 'history_response.g.dart';

@JsonSerializable()
class HistoryResponse {
  @JsonKey(name: "result")
  final String result;
  @JsonKey(name: "data")
  final HistoryResponseData data;

  HistoryResponse(this.result, this.data);

  factory HistoryResponse.fromJson(Map<String, dynamic> json) => _$HistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseToJson(this);
}

@JsonSerializable()
class HistoryResponseData {
  @JsonKey(name: 'hasMore')
  final bool hasMore;
  @JsonKey(name: 'revision')
  final String revision;
  @JsonKey(name: "messages")
  final List<Message?>? messages;

  HistoryResponseData({
    required this.hasMore,
    required this.revision,
    this.messages,
  });

  factory HistoryResponseData.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseDataToJson(this);
}
