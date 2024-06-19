import 'package:films_app/repository/models/top_films/topfilms.dart';

abstract class AbstractTopFilmsRep {
  Future<List<TopFilms>> getTopFilmsList();
}
