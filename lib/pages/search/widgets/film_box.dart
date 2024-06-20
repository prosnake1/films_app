import 'package:cached_network_image/cached_network_image.dart';
import 'package:films_app/repository/models/searched_films/searchedfilm.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';

Row buildFilmBox(SearchedFilm film, BuildContext context) {
  return Row(
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
            Text(film.year.toString(), style: lightTheme.textTheme.labelLarge),
          ],
        ),
      ),
    ],
  );
}
