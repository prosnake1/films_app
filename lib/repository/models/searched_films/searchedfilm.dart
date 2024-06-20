class SearchedFilm {
  SearchedFilm({
    required this.nameRu,
    required this.posterUrl,
    required this.year,
  });
  final String? nameRu;
  final String posterUrl;
  final String year;

  factory SearchedFilm.fromJson(Map<String, dynamic> json) {
    return SearchedFilm(
      nameRu: json['nameRu'],
      posterUrl: json['posterUrl'],
      year: json['year'],
    );
  }
}
