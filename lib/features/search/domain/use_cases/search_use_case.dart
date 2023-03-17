import 'package:objective/features/search/domain/model/hero.dart';
import 'package:objective/features/search/domain/repository_interface.dart';
import 'package:objective/features/search/domain/use_cases/search_use_case_interface.dart';

class SearchUseCase implements SearchUseCaseInterface {
  SearchRepositoryInterface repo;

  SearchUseCase(this.repo);

  @override
  Future<List<MarvelHero>> call(String? query) async {
    await repo.search(query);
    return [];
  }
}