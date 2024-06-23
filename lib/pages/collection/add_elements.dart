import 'package:films_app/repository/models/collection_film/collectionfilm.dart';

void addElements(Map<String, dynamic> map, List<CollectionFilm> films) {
  for (var filmMap in map.values) {
    CollectionFilm filmModel =
        CollectionFilm.fromMap(Map<String, dynamic>.from(filmMap));
    films.add(filmModel);
  }
}
