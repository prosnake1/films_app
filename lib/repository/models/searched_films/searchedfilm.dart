class SearchedFilm {
  SearchedFilm(
      {required this.nameRu,
      required this.posterUrl,
      required this.year,
      required this.filmId});
  final String? nameRu;
  final String posterUrl;
  final String year;
  final int filmId;

  factory SearchedFilm.fromJson(Map<String, dynamic> json) {
    return SearchedFilm(
      nameRu: json['nameRu'],
      posterUrl: json['posterUrl'],
      year: json['year'],
      filmId: json['filmId'],
    );
  }
}
