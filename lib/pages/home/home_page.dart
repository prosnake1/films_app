import 'package:films_app/pages/home/bloc/top_films_bloc.dart';
import 'package:films_app/pages/home/widgets/widgets.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _topFilmsBloc = TopFilmsBloc(GetIt.I<AbstractTopFilmsRep>());
  @override
  void initState() {
    _topFilmsBloc.add(LoadFilmsEvent());
    super.initState();
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
          FilmsColumn(topFilmsBloc: _topFilmsBloc),
          SizedBox(
            height: 200,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home/search');
                  },
                  style: lightTheme.elevatedButtonTheme.style,
                  child: const Text('Перейти к поиску'),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home/collection');
                  },
                  style: lightTheme.elevatedButtonTheme.style,
                  child: const Text('Перейти к коллекции'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
