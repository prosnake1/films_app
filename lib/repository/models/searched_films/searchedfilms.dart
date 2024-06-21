import 'package:films_app/repository/models/searched_films/searchedfilm.dart';

class SearchedFilms {
  SearchedFilms({required this.searchFilmsCountResult, required this.films});
  final int searchFilmsCountResult;
  final List<SearchedFilm> films;
}
