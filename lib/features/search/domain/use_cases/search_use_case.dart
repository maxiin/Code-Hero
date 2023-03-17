import 'package:objective/features/search/domain/model/search.dart';
import 'package:objective/features/search/domain/repository_interface.dart';
import 'package:objective/features/search/domain/use_cases/search_use_case_interface.dart';

class SearchUseCase implements SearchUseCaseInterface {
  SearchRepositoryInterface repo;

  SearchUseCase(this.repo);

  @override
  Future<MarvelSearch> call(String? query, int page) async {
    return await repo.search(query, page);
  }
}