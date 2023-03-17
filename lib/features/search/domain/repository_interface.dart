import 'package:objective/features/search/domain/model/hero.dart';
import 'package:objective/features/search/domain/model/search.dart';

abstract class SearchRepositoryInterface {
  Future<MarvelSearch> search(String? query, int page);
}