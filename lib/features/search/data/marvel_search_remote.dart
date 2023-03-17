import 'dart:convert';

import 'package:objective/features/search/data/marvel_search_remote_interface.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:objective/features/search/data/model/search_api.dart';

class MarvelSearchRemote implements MarvelSearchRemoteInterface {
  final dio = Dio();

  @override
  Future<SearchApi> search(String? query) async {
    const public = String.fromEnvironment("MARVEL_PUBLIC");
    const private = String.fromEnvironment("MARVEL_PRIVATE");
    int ts = DateTime.now().millisecondsSinceEpoch;

    var bytes = utf8.encode("$ts$private$public");
    var digest = md5.convert(bytes);
    
    final response = await dio.get('https://gateway.marvel.com:443/v1/public/characters', queryParameters: {'apikey': public, 'ts': ts, 'hash': digest.toString()});
    SearchApi search = SearchApi.fromJson(response.data['data']);
    return search;
  }

}