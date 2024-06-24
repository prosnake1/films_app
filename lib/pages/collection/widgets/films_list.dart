import 'package:films_app/pages/collection/widgets/widgets.dart';
import 'package:films_app/repository/models/collection_film/collectionfilm.dart';
import 'package:flutter/material.dart';

class FilmsList extends StatelessWidget {
  const FilmsList({
    super.key,
    required this.films,
  });

  final List<CollectionFilm> films;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: films.length,
      itemBuilder: (context, index) {
        CollectionFilm film = films[index];
        return FilmTileBox(film: film, films: films);
      },
    );
  }
}
