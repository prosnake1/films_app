class MovieInfo {
  MovieInfo(
      {required this.nameRu,
      required this.nameOriginal,
      required this.posterUrl,
      required this.ratingKinopoisk,
      required this.year,
      required this.description});
  final String? nameRu;
  final String nameOriginal;
  final String posterUrl;
  final double? ratingKinopoisk;
  final int year;
  final String? description;
  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    return MovieInfo(
      nameRu: json['nameRu'],
      nameOriginal: json['nameOriginal'],
      posterUrl: json['posterUrl'],
      ratingKinopoisk: json['ratingKinopoisk'],
      year: json['year'],
      description: json['description'],
    );
  }
}
