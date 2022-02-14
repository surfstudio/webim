import 'package:json_annotation/json_annotation.dart';
import 'package:webim_sdk/src/domain/delta_response.dart';

part 'webim_authorization.g.dart';

@JsonSerializable()
class WebimAuthorization {
  @JsonKey(name: "authToken")
  final String authToken;
  @JsonKey(name: "pageId")
  final String pageId;
  @JsonKey(name: "accountName")
  final String? accountName;
  @JsonKey(name: "location")
  final String? location;
  @JsonKey(name: "visitorFields")
  final String? visitorFields;

  WebimAuthorization({
    required this.authToken,
    required this.pageId,
    required this.accountName,
    required this.location,
    required this.visitorFields,
  });

  factory WebimAuthorization.fromJson(Map<String, dynamic> json) =>
      _$WebimAuthorizationFromJson(json);

  factory WebimAuthorization.fromDeltaResponse(
    DeltaResponse response,
    String accountName,
    String location,
    String visitorFields,
  ) {
    return WebimAuthorization(
      authToken: response.fullUpdate?.authToken ?? '',
      pageId: response.fullUpdate?.pageId ?? '',
      accountName: accountName,
      location: location,
      visitorFields: visitorFields,
    );
  }

  Map<String, dynamic> toJson() => _$WebimAuthorizationToJson(this);
}
