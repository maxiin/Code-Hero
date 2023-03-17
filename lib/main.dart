import 'package:flutter/material.dart';
import 'package:objective/features/presentation/search_page.dart';
import 'package:objective/shared/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Hero',
      theme: ThemeData(
        primarySwatch: AppColors.marvelRed,
      ),
      home: const SearchPage(),
    );
  }
}
