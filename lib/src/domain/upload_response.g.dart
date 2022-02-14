// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) => UploadResponse(
      FileParametersItem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadResponseToJson(UploadResponse instance) => <String, dynamic>{
      'data': instance.data,
    };

FileParametersItem _$FileParametersItemFromJson(Map<String, dynamic> json) => FileParametersItem(
      size: json['size'] as int?,
      guid: json['guid'] as String?,
      contentType: json['content_type'] as String?,
      filename: json['filename'] as String?,
      image: json['image'] == null
          ? null
          : WMImageParams.fromJson(json['image'] as Map<String, dynamic>),
      visitorId: json['visitor_id'] as String?,
      clientContentType: json['client_content_type'] as String?,
    );

Map<String, dynamic> _$FileParametersItemToJson(FileParametersItem instance) => <String, dynamic>{
      'size': instance.size,
      'guid': instance.guid,
      'content_type': instance.contentType,
      'filename': instance.filename,
      'image': instance.image,
      'visitor_id': instance.visitorId,
      'client_content_type': instance.clientContentType,
    };

WMImageParams _$WMImageParamsFromJson(Map<String, dynamic> json) => WMImageParams(
      WMImageSize.fromJson(json['size'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WMImageParamsToJson(WMImageParams instance) => <String, dynamic>{
      'size': instance.size,
    };

WMImageSize _$WMImageSizeFromJson(Map<String, dynamic> json) => WMImageSize(
      json['width'] as int,
      json['height'] as int,
    );

Map<String, dynamic> _$WMImageSizeToJson(WMImageSize instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
