import 'package:films_app/repository/dio/searched_films_rep.dart';
import 'package:films_app/repository/models/searched_films/searchedfilms.dart';
import 'package:films_app/repository/singleton/keyword.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  KeywordSingleton keywordSingleton = GetIt.I.get<KeywordSingleton>();
  final controller = TextEditingController();
  List<SearchedFilms> searchedFilms = [];
  @override
  void initState() {
    getFilmsList();
    super.initState();
  }

  void getFilmsList() async {
    searchedFilms = await SearchedFilmsRepository().getFilmsList();
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            onSubmitted: (value) {
              String text = controller.text;
              keywordSingleton.updateValue(text);
              getFilmsList();
            },
          ),
        ],
      ),
    );
  }
}
