import 'package:json_annotation/json_annotation.dart';

part 'file_api.g.dart';

@JsonSerializable()
class FileApi {
  final String path;
  final String extension;

  FileApi({required this.path, required this.extension});

  factory FileApi.fromJson(Map<String, dynamic> json) => _$FileApiFromJson(json);

  Map<String, dynamic> toJson() => _$FileApiToJson(this);
}