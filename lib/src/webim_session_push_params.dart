import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'webim_session_push_params.g.dart';

@JsonSerializable()
class WebimSessionPushParams {
  @JsonKey()
  final WebimSessionPushService pushService;
  @JsonKey()
  final WebimSessionPushPtatform pushPtatform;
  @JsonKey()
  final String pushToken;

  WebimSessionPushParams({
    required this.pushService,
    required this.pushPtatform,
    required this.pushToken,
  });

  factory WebimSessionPushParams.fromJson(Map<String, dynamic> json) =>
      _$WebimSessionPushParamsFromJson(json);

  Map<String, dynamic> toJson() => _$WebimSessionPushParamsToJson(this);
}

enum WebimSessionPushService {
  @JsonValue('fcm')
  fcm,
  @JsonValue('gcm')
  gcm,
  @JsonValue('anps')
  anps,
}

extension WebimSessionPushServiceX on WebimSessionPushService {
  String? get value => _$WebimSessionPushServiceEnumMap[this];
}

enum WebimSessionPushPtatform {
  @JsonValue('android')
  android,
  @JsonValue('iOS')
  iOS,
}

extension WebimSessionPushPtatformX on WebimSessionPushPtatform {
  String? get value => _$WebimSessionPushPtatformEnumMap[this];
}
