import 'package:cached_network_image/cached_network_image.dart';
import 'package:films_app/repository/models/collection_film/collectionfilm.dart';
import 'package:films_app/repository/singletons/singleton.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
        return SizedBox(
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: film.posterUrl,
                width: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.height / 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    film.filmName,
                    style: lightTheme.textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        GetIt.I
                            .get<MovieIdSingleton>()
                            .updateValue(films[0].kinopoiskId);
                        Navigator.of(context).pushNamed('/movie');
                      },
                      child: const Text('Перейти'))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
