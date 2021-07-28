// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webim_session_push_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebimSessionPushParams _$WebimSessionPushParamsFromJson(
    Map<String, dynamic> json) {
  return WebimSessionPushParams(
    pushService: _$enumDecodeNullable(
        _$WebimSessionPushServiceEnumMap, json['pushService']),
    pushPtatform: _$enumDecodeNullable(
        _$WebimSessionPushPtatformEnumMap, json['pushPtatform']),
    pushToken: json['pushToken'] as String,
  );
}

Map<String, dynamic> _$WebimSessionPushParamsToJson(
        WebimSessionPushParams instance) =>
    <String, dynamic>{
      'pushService': _$WebimSessionPushServiceEnumMap[instance.pushService],
      'pushPtatform': _$WebimSessionPushPtatformEnumMap[instance.pushPtatform],
      'pushToken': instance.pushToken,
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

const _$WebimSessionPushServiceEnumMap = {
  WebimSessionPushService.fcm: 'fcm',
  WebimSessionPushService.gcm: 'gcm',
  WebimSessionPushService.anps: 'anps',
};

const _$WebimSessionPushPtatformEnumMap = {
  WebimSessionPushPtatform.android: 'android',
  WebimSessionPushPtatform.iOS: 'iOS',
};
