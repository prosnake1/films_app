import 'package:films_app/repository/models/searched_films/searchedfilm.dart';
import 'package:films_app/repository/models/top_films/film.dart';

abstract class AbstractTopFilmsRep {
  Future<List<Film>> getTopFilmsList();
}

abstract class AbstractSearchedFilmsRep {
  Future<List<SearchedFilm>> getFilmsList();
}
