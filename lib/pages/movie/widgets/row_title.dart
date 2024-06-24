import 'package:films_app/repository/models/movie_info/movie.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';

Row buildRowTitle(MovieInfo infoList) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(infoList.nameRu ?? infoList.nameOriginal ?? '',
          style: lightTheme.textTheme.titleLarge),
      Card(
        color: lightTheme.cardColor,
        child: Text(
          infoList.ratingKinopoisk.toString(),
          style: lightTheme.textTheme.labelSmall,
        ),
      )
    ],
  );
}
