import 'package:objective/features/search/data/model/collection_item_api.dart';

import 'package:json_annotation/json_annotation.dart';

part 'collection_api.g.dart';

@JsonSerializable()
class CollectionApi {
  final int available;
  final String collectionURI;
  final List<CollectionItemApi> items;
  final int returned;

  CollectionApi({required this.available, required this.collectionURI, required this.items, required this.returned});
  
  factory CollectionApi.fromJson(Map<String, dynamic> json) => _$CollectionApiFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionApiToJson(this);
}