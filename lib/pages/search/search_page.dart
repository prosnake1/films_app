import 'package:films_app/pages/search/widgets/film_box.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/singletons/singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/searched_films_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchedFilmsBloc =
      SearchedFilmsBloc(GetIt.I<AbstractSearchedFilmsRep>());
  CurrentPageSingleton currentPageSingleton =
      GetIt.I.get<CurrentPageSingleton>();
  final controller = TextEditingController();

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
              GetIt.I.get<KeywordSingleton>().updateValue(text);
              _searchedFilmsBloc.add(LoadFilmsList());
            },
          ),
          BlocBuilder<SearchedFilmsBloc, SearchedFilmsState>(
            bloc: _searchedFilmsBloc,
            builder: (context, state) {
              if (state is LoadedFilmsList) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.films.length,
                    itemBuilder: (context, i) {
                      final film = state.films[i];
                      return InkWell(
                        onTap: () {
                          GetIt.I
                              .get<MovieIdSingleton>()
                              .updateValue(film.filmId);
                          GetIt.I
                              .get<FilmNameSingleton>()
                              .updateValue(film.nameRu ?? '');
                          Navigator.of(context).pushNamed('/movie');
                          setState(() {});
                        },
                        child: buildFilmBox(film, context),
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
          (GetIt.I.get<KeywordSingleton>().keyword == '')
              ? const SizedBox()
              : Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.grey.shade300,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            _searchedFilmsBloc.add(LoadFilmsList());
                            currentPageSingleton.previousPage();
                            setState(() {});
                          },
                          child: const Icon(Icons.chevron_left_outlined)),
                      Text(currentPageSingleton.page.toString()),
                      TextButton(
                          onPressed: () {
                            _searchedFilmsBloc.add(LoadFilmsList());
                            currentPageSingleton.nextPage();
                            setState(() {});
                          },
                          child: const Icon(Icons.chevron_right_outlined))
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
