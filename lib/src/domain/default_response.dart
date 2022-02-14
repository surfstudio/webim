import 'package:json_annotation/json_annotation.dart';

import 'package:webim_sdk/src/domain/delta_response.dart';

part 'default_response.g.dart';

@JsonSerializable()
class DefaultResponse extends ErrorResponse {
  DefaultResponse(this.result);

  @JsonKey(name: "result")
  final String? result;

  factory DefaultResponse.fromJson(Map<String, dynamic> json) => _$DefaultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}
