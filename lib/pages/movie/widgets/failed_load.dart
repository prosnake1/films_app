import 'package:films_app/pages/movie/bloc/movie_info_bloc.dart';
import 'package:flutter/material.dart';

class FailedLoadingWidget extends StatelessWidget {
  const FailedLoadingWidget({
    super.key,
    required MovieInfoBloc filmInfoBloc,
  }) : _filmInfoBloc = filmInfoBloc;

  final MovieInfoBloc _filmInfoBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Что-то пошло не так...'),
        TextButton(
            onPressed: () {
              _filmInfoBloc.add(LoadInfoList());
            },
            child: const Text('Повторить'))
      ],
    );
  }
}
