import 'package:json_annotation/json_annotation.dart';

part 'upload_response.g.dart';

@JsonSerializable()
class UploadResponse {
  @JsonKey()
  final FileParametersItem data;

  UploadResponse(this.data);

  factory UploadResponse.fromJson(Map<String, dynamic> json) => _$UploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadResponseToJson(this);
}

@JsonSerializable()
class FileParametersItem {
  @JsonKey(name: "size")
  final int? size;
  @JsonKey(name: "guid")
  final String? guid;
  @JsonKey(name: "content_type")
  final String? contentType;
  @JsonKey(name: "filename")
  final String? filename;
  @JsonKey(name: "image")
  final WMImageParams? image;
  @JsonKey(name: "visitor_id")
  final String? visitorId;
  @JsonKey(name: "client_content_type")
  final String? clientContentType;

  FileParametersItem({
    this.size,
    this.guid,
    this.contentType,
    this.filename,
    this.image,
    this.visitorId,
    this.clientContentType,
  });

  factory FileParametersItem.fromJson(Map<String, dynamic> json) =>
      _$FileParametersItemFromJson(json);

  Map<String, dynamic> toJson() => _$FileParametersItemToJson(this);
}

@JsonSerializable()
class WMImageParams {
  final WMImageSize size;

  WMImageParams(this.size);

  factory WMImageParams.fromJson(Map<String, dynamic> json) => _$WMImageParamsFromJson(json);

  Map<String, dynamic> toJson() => _$WMImageParamsToJson(this);
}

@JsonSerializable()
class WMImageSize {
  @JsonKey(name: "width")
  final int width;
  @JsonKey(name: "height")
  final int height;

  WMImageSize(this.width, this.height);

  factory WMImageSize.fromJson(Map<String, dynamic> json) => _$WMImageSizeFromJson(json);

  Map<String, dynamic> toJson() => _$WMImageSizeToJson(this);
}
