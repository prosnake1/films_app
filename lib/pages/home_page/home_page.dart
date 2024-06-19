import 'package:films_app/pages/home_page/bloc/top_films_bloc.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocBuilder<TopFilmsBloc, TopFilmsState>(
            bloc: _topFilmsBloc,
            builder: (context, state) {
              if (state is FilmsListLoaded) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      height: 30,
                    ),
                    itemCount: state.filmsList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      final film = state.filmsList[i];
                      return SizedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 8,
                              child: Center(
                                  child: Text('${i + 1}',
                                      style: lightTheme.textTheme.labelLarge)),
                            ),
                            Image.network(
                              film.posterUrl,
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    film.nameRu ?? 'No Name',
                                    style: lightTheme.textTheme.labelLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(film.year.toString(),
                                      style: lightTheme.textTheme.labelLarge),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const SizedBox(
            height: 300,
          )
        ],
      ),
    );
  }
}
