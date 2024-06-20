import 'package:films_app/repository/models/searched_films/searchedfilm.dart';

class SearchedFilms {
  SearchedFilms(
      {required this.pagesCount,
      required this.searchFilmsCountResult,
      required this.films});
  final int pagesCount;
  final int searchFilmsCountResult;
  final List<SearchedFilm> films;
}
