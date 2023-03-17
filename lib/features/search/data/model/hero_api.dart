import 'package:objective/features/search/data/model/collection_api.dart';
import 'package:objective/features/search/data/model/file_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objective/features/search/data/model/url_api.dart';

part 'hero_api.g.dart';

@JsonSerializable()
class HeroApi {
  final int id;
  final String name;
  final String description;
  final String modified;
  final FileApi thumbnail;
  final String resourceURI;
  final CollectionApi comics;
  final CollectionApi series;
  final CollectionApi stories;
  final CollectionApi events;
  final List<UrlApi> urls;

  HeroApi({required this.urls, required this.comics, required this.series, required this.stories, required this.events, required this.id, required this.name, required this.description, required this.modified, required this.thumbnail, required this.resourceURI});

  factory HeroApi.fromJson(Map<String, dynamic> json) => _$HeroApiFromJson(json);

  Map<String, dynamic> toJson() => _$HeroApiToJson(this);

}