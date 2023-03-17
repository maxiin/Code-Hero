import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:objective/features/search/domain/model/hero.dart';
import 'package:objective/features/search/domain/model/search.dart';
import 'package:objective/features/search/domain/use_cases/search_use_case_interface.dart';

part 'search_page_view_model.g.dart';

class SearchPageViewModel = SearchPageViewModelBase with _$SearchPageViewModel;

enum Status {
  loading,
  error,
  success
}

abstract class SearchPageViewModelBase with Store {
  SearchUseCaseInterface usecase;

  SearchPageViewModelBase(this.usecase);

  @observable
  Status screenStatus = Status.loading;

  @observable
  List<MarvelHero> heroes = [];

  @observable
  int available = 1;
  @observable
  int page = 1;

  Timer? timer;

  @action
  Future<void> search({String? query}) async {
    screenStatus = Status.loading;
    late MarvelSearch response;
    try {
      response = await usecase.call(query);
    } catch (e) {
      debugPrint(e.toString());
      screenStatus = Status.error;
      return;
    }
    page = response.page;
    available = response.available;
    heroes = response.heroes;
    screenStatus = Status.success;
  }

  @action prepareSearch(String text) async {
    screenStatus = Status.loading;
    if(timer != null){
      timer!.cancel();
    }
    timer = Timer(const Duration(milliseconds: 2000), () async {
      await search(query: text);
      timer!.cancel();
      timer = null;
    });
  }

}