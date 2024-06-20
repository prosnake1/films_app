import 'package:films_app/repository/models/top_films/film.dart';

abstract class AbstractTopFilmsRep {
  Future<List<Film>> getTopFilmsList();
}
