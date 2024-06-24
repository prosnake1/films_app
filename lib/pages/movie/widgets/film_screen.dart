import 'package:films_app/pages/movie/widgets/widgets.dart';
import 'package:films_app/repository/models/movie_info/movie.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';

Column buildFilmScreen(MovieInfo infoList) {
  return Column(
    children: [
      PosterWidget(infoList: infoList),
      const SizedBox(height: 15),
      buildRowTitle(infoList),
      Text(infoList.year.toString(), style: lightTheme.textTheme.labelLarge),
      Text(
        infoList.countries!.join(', ').toString(),
        style: lightTheme.textTheme.labelLarge,
      ),
      Text(
        infoList.genres!.join(', ').toString(),
        style: lightTheme.textTheme.labelLarge,
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              infoList.description ?? '',
              style: lightTheme.textTheme.titleMedium,
            ),
          ],
        ),
      )
    ],
  );
}
