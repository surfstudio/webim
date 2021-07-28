// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webim_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebimCache _$WebimCacheFromJson(Map<String, dynamic> json) {
  return WebimCache(
    messageList: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..readingSince = json['readingSince'] as int
    ..readingBefore = json['readingBefore'] as int;
}

Map<String, dynamic> _$WebimCacheToJson(WebimCache instance) =>
    <String, dynamic>{
      'list': instance.messageList,
      'readingSince': instance.readingSince,
      'readingBefore': instance.readingBefore,
    };
