import 'package:objective/features/search/domain/model/hero.dart';

class MarvelSearch {
  final int page;
  final int available;
  final List<MarvelHero> heroes;

  MarvelSearch({required this.page, required this.available, required this.heroes});
}