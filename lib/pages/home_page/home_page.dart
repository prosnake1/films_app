import 'package:films_app/pages/home_page/widgets/films_column.dart';
import 'package:films_app/repository/dio/api.dart';
import 'package:films_app/repository/models/top_films/topfilms.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TopFilms> films = [];
  @override
  void initState() {
    getList();
    super.initState();
  }

  void getList() async {
    films = await ApiService().getTopFilmsList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Главная страница',
          style: lightTheme.textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Films(films: films),
          const SizedBox(
            height: 300,
          )
        ],
      ),
    );
  }
}
