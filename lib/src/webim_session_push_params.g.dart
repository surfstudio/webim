// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webim_session_push_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebimSessionPushParams _$WebimSessionPushParamsFromJson(Map<String, dynamic> json) =>
    WebimSessionPushParams(
      pushService: $enumDecode(_$WebimSessionPushServiceEnumMap, json['pushService']),
      pushPtatform: $enumDecode(_$WebimSessionPushPtatformEnumMap, json['pushPtatform']),
      pushToken: json['pushToken'] as String,
    );

Map<String, dynamic> _$WebimSessionPushParamsToJson(WebimSessionPushParams instance) =>
    <String, dynamic>{
      'pushService': _$WebimSessionPushServiceEnumMap[instance.pushService],
      'pushPtatform': _$WebimSessionPushPtatformEnumMap[instance.pushPtatform],
      'pushToken': instance.pushToken,
    };

const _$WebimSessionPushServiceEnumMap = {
  WebimSessionPushService.fcm: 'fcm',
  WebimSessionPushService.gcm: 'gcm',
  WebimSessionPushService.anps: 'anps',
};

const _$WebimSessionPushPtatformEnumMap = {
  WebimSessionPushPtatform.android: 'android',
  WebimSessionPushPtatform.iOS: 'iOS',
};
