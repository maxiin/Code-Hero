import 'dart:math';

import 'package:flutter/material.dart';
import 'package:objective/features/search/domain/model/hero.dart';
import 'package:objective/shared/colors.dart';

class DetailsPage extends StatelessWidget {
  final MarvelHero hero;

  const DetailsPage(this.hero, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget contentList(List<String> list, String label, int maxItens) {
      if(list.isEmpty) {
        return const SizedBox();
      }

      List<String> cutList = list.toList();
      cutList.removeRange(min(list.length, maxItens), list.length);

      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            Text('$label com o personagem'),
            const SizedBox(height: 2,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.marvelRed, width: 2)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...cutList.map((e) => Text(e)),
                  list.length > maxItens ? Text('... E mais ${list.length - maxItens} outro${list.length - maxItens == 1 ? '' : 's'}') : const SizedBox()
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              color: AppColors.marvelRed,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Image.network(hero.thumbnail, height: 85,)),
                  const SizedBox(width: 24,),
                  Expanded(flex: 3, child: Text(hero.name, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Roboto', fontWeight: FontWeight.bold),))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Descrição', style: TextStyle(color: AppColors.marvelRed, fontSize: 16, fontFamily: 'Roboto'),),
                  const SizedBox(height: 8,),
                  hero.description.isEmpty ? Text(hero.description) : const Text('Sem Descrição disponível')
                ],
              ),
            ),
            contentList(hero.comics, 'Comics', 4),
            contentList(hero.series, 'Séries', 4),
            contentList(hero.stories, 'Histórias', 4),
            contentList(hero.events, 'Eventos', 4),
          ],
        )
      ),
    );
  }

}