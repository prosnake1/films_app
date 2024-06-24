import 'package:films_app/pages/search/bloc/searched_films_bloc.dart';
import 'package:flutter/material.dart';

class ReloadWidget extends StatelessWidget {
  const ReloadWidget({
    super.key,
    required SearchedFilmsBloc searchedFilmsBloc,
  }) : _searchedFilmsBloc = searchedFilmsBloc;

  final SearchedFilmsBloc _searchedFilmsBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Что-то пошло не так...'),
        TextButton(
            onPressed: () {
              _searchedFilmsBloc.add(LoadFilmsList());
            },
            child: const Text('Повторить'))
      ],
    );
  }
}
