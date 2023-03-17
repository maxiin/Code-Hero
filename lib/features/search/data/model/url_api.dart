import 'package:json_annotation/json_annotation.dart';

part 'url_api.g.dart';

@JsonSerializable()
class UrlApi {
  final String? type;
  final String? url;

  UrlApi(this.type, this.url);
  
  factory UrlApi.fromJson(Map<String, dynamic> json) => _$UrlApiFromJson(json);

  Map<String, dynamic> toJson() => _$UrlApiToJson(this);
}