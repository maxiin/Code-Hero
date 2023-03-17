import 'package:objective/features/search/domain/model/hero.dart';

abstract class SearchUseCaseInterface {
  Future<List<MarvelHero>> call(String? query);
}