import 'package:json_annotation/json_annotation.dart';

part 'collection_item_api.g.dart';

@JsonSerializable()
class CollectionItemApi {
  final String resourceURI;
  final String name;

  CollectionItemApi(this.name, this.resourceURI);
  
  factory CollectionItemApi.fromJson(Map<String, dynamic> json) => _$CollectionItemApiFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionItemApiToJson(this);
}