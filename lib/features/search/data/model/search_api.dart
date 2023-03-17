import 'package:json_annotation/json_annotation.dart';
import 'package:objective/features/search/data/model/hero_api.dart';

part 'search_api.g.dart';

@JsonSerializable()
class SearchApi {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<HeroApi> results;

  SearchApi({required this.offset, required this.limit, required this.total, required this.count, required this.results});
  
  factory SearchApi.fromJson(Map<String, dynamic> json) => _$SearchApiFromJson(json);

  Map<String, dynamic> toJson() => _$SearchApiToJson(this);
}