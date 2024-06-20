import 'package:cached_network_image/cached_network_image.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/singleton/keyword.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  KeywordSingleton keywordSingleton = GetIt.I.get<KeywordSingleton>();
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
              keywordSingleton.updateValue(text);
              _searchedFilmsBloc.add(LoadFilmsList());
            },
          ),
          BlocBuilder<SearchedFilmsBloc, SearchedFilmsState>(
            bloc: _searchedFilmsBloc,
            builder: (context, state) {
              if (state is LoadedFilmsList) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.films[0].films.length,
                    itemBuilder: (context, i) {
                      final film = state.films[0].films[i];
                      return SizedBox(
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: film.posterUrl,
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
          )
        ],
      ),
    );
  }
}
