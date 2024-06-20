import 'package:films_app/pages/search/widgets/film_box.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/singletons/currentpage.dart';
import 'package:films_app/repository/singletons/keyword.dart';
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
  KeywordSingleton keywordSingleton = GetIt.I.get<KeywordSingleton>();
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
              keywordSingleton.updateValue(text);
              _searchedFilmsBloc.add(LoadFilmsList());
            },
          ),
          Expanded(
            child: BlocBuilder<SearchedFilmsBloc, SearchedFilmsState>(
              bloc: _searchedFilmsBloc,
              builder: (context, state) {
                if (state is LoadedFilmsList) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      shrinkWrap: true,
                      itemCount: state.films[0].films.length,
                      itemBuilder: (context, i) {
                        final film = state.films[0].films[i];
                        return SizedBox(
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
          ),
          Container(
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
