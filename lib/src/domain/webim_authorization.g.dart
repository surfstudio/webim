// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webim_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebimAuthorization _$WebimAuthorizationFromJson(Map<String, dynamic> json) {
  return WebimAuthorization(
    authToken: json['authToken'] as String,
    pageId: json['pageId'] as String,
    accountName: json['accountName'] as String,
    location: json['location'] as String,
    visitorFields: json['visitorFields'] as String,
  );
}

Map<String, dynamic> _$WebimAuthorizationToJson(WebimAuthorization instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'pageId': instance.pageId,
      'accountName': instance.accountName,
      'location': instance.location,
      'visitorFields': instance.visitorFields,
    };
