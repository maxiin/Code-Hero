import 'package:objective/features/search/domain/model/hero.dart';

abstract class SearchRepositoryInterface {
  Future<List<MarvelHero>> search(String? query);
}