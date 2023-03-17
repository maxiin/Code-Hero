import 'package:objective/features/search/data/marvel_search_remote_interface.dart';
import 'package:objective/features/search/data/model/search_api.dart';
import 'package:objective/features/search/data/model/url_api.dart';
import 'package:objective/features/search/domain/model/hero.dart';
import 'package:objective/features/search/domain/model/search.dart';
import 'package:objective/features/search/domain/repository_interface.dart';

class SearchRepository implements SearchRepositoryInterface {
  final MarvelSearchRemoteInterface remote;

  SearchRepository(this.remote);

  @override
  Future<MarvelSearch> search(String? query, int page) async {
    SearchApi searchResponse = await remote.search(query, page);
    List<MarvelHero> heroesList = [];
    for (var heroesApi in searchResponse.results) {
      heroesList.add(
        MarvelHero(
          name: heroesApi.name, 
          description: heroesApi.description, 
          thumbnail: '${heroesApi.thumbnail.path}.${heroesApi.thumbnail.extension}', 
          comics: heroesApi.comics.items.map((e) => e.name).toList(), 
          series: heroesApi.series.items.map((e) => e.name).toList(), 
          stories: heroesApi.stories.items.map((e) => e.name).toList(), 
          events: heroesApi.events.items.map((e) => e.name).toList(), 
          detail: heroesApi.urls.firstWhere((element) => element.type == 'detail', orElse: () => UrlApi(null, null)).url, 
          comiclink: heroesApi.urls.firstWhere((element) => element.type == 'comiclink', orElse: () => UrlApi(null, null)).url,
          wiki: heroesApi.urls.firstWhere((element) => element.type == 'wiki', orElse: () => UrlApi(null, null)).url
        ));
    }
    return MarvelSearch(
      page: searchResponse.offset == 0 ? 1 : (searchResponse.offset / searchResponse.count).ceil() + 1,
      available: searchResponse.total == 0 ? 0 : (searchResponse.total / searchResponse.count).ceil(),
      heroes: heroesList
    );
  }

}