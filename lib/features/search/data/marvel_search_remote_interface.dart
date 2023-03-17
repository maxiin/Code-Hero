import 'package:objective/features/search/data/model/search_api.dart';

abstract class MarvelSearchRemoteInterface {
  Future<SearchApi> search(String? query);
}