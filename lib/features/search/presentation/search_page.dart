import 'package:flutter/material.dart';
import 'package:objective/features/search/data/marvel_search_remote.dart';
import 'package:objective/features/search/domain/repository.dart';
import 'package:objective/features/search/domain/use_cases/search_use_case.dart';
import 'package:objective/features/search/presentation/search_page_view_model.dart';
import 'package:objective/shared/colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late SearchPageViewModel viewModel;
  final int listSize = 4;

  @override
  void initState() {
    super.initState();
    setup();
    viewModel.search();
  }

  void setup(){
    MarvelSearchRemote remote = MarvelSearchRemote();
    SearchRepository repo = SearchRepository(remote);
    SearchUseCase useCase = SearchUseCase(repo);
    viewModel = SearchPageViewModel(useCase);
  }

  Widget pageButton(int page, bool selected) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.marvelRed
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: selected ? AppColors.marvelRed : Colors.white
      ),
      child: Center(
        child: Text(page.toString(), style: TextStyle(
          fontSize: 21, 
          color: selected ? Colors.white : AppColors.marvelRed, 
          fontFamily: 'Roboto'
        ),)
      ),
    );
  }

  Widget heroNavigationBar(int page, int available) {
    List<int> btnValue = [];
    List<Widget> btns = [];

    if(page == 1){
      btnValue = [1,2,3];
    } else {
      btnValue = [page -1, page, page +1];
      if(available < btnValue[2] && page > 2){
        btnValue = [page-2, page-1, page];
      }
    }
    
    btnValue.removeWhere((element) => element > available);

    for (var value in btnValue) {
      if(value != 1) {
        btns.add(const Spacer(flex: 2,));
      }
      btns.add(pageButton(value, value == page));
    }

    return Column(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 18.0, 30.0, 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_left, size: 64, color: AppColors.marvelRed,),
              const Spacer(flex: 6,),
              ...btns,
              const Spacer(flex: 6,),
              Icon(Icons.arrow_right, size: 64, color: AppColors.marvelRed,)
            ],
          ),
        ),
        Container(height: 12, color: AppColors.marvelRed,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 42),
              child: Row(
                children: [
                  Text('Busca Marvel'.toUpperCase(), style: TextStyle(color: AppColors.marvelRed, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w700),), 
                  Text('Teste Mobile'.toUpperCase(), style: TextStyle(color: AppColors.marvelRed, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w300),)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome do personagem'
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Observer(
                builder: (context) {
                  if(viewModel.screenStatus == Status.loading) {
                    return Center(child: CircularProgressIndicator(color: AppColors.marvelRed),);
                  } else if (viewModel.screenStatus == Status.error) {
                    return Padding(
                      padding: const EdgeInsets.all(42),
                      child: Center(child: Text('Ocorreu um erro, cheque sua conexão com a internet e tente novamente', textAlign: TextAlign.center, style: TextStyle(color: AppColors.marvelRed, fontSize: 16, fontFamily: 'Roboto'),),),
                    );
                  }
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: 37,
                        color: AppColors.marvelRed,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 90), 
                          child: Text('Nome', style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Roboto'),),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(itemBuilder: (context, i) {
                          return Text(i.toString());
                        }),
                      )
                    ],
                  );
                }
              )
            )
            
            // ListView.builder(itemBuilder: (BuildContext, int) {

            // }),
          ],
        )
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return heroNavigationBar(viewModel.page, (viewModel.available / listSize).ceil());
        }
      ),
    );
  }

}