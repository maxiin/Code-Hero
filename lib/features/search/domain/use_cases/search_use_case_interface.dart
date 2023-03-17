import 'package:objective/features/search/domain/model/search.dart';

abstract class SearchUseCaseInterface {
  Future<MarvelSearch> call(String? query, int page);
}