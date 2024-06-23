class CollectionFilm {
  final String filmName;
  final String filmId;
  final String posterUrl;
  final int kinopoiskId;

  CollectionFilm(
      {required this.filmName,
      required this.filmId,
      required this.posterUrl,
      required this.kinopoiskId});
  static CollectionFilm fromMap(Map<String, dynamic> map) {
    return CollectionFilm(
      filmName: map['filmName'],
      filmId: map['filmId'],
      posterUrl: map['posterUrl'],
      kinopoiskId: map['kinopoiskId'],
    );
  }
}
