import 'package:cached_network_image/cached_network_image.dart';
import 'package:films_app/pages/home/bloc/top_films_bloc.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmsColumn extends StatelessWidget {
  const FilmsColumn({
    super.key,
    required TopFilmsBloc topFilmsBloc,
  }) : _topFilmsBloc = topFilmsBloc;

  final TopFilmsBloc _topFilmsBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopFilmsBloc, TopFilmsState>(
      bloc: _topFilmsBloc,
      builder: (context, state) {
        if (state is FilmsListLoaded) {
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 20,
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
    );
  }
}
