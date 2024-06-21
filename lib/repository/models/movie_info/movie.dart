class Movie {
  Movie(
      {required this.nameRu,
      required this.nameOriginal,
      required this.posterUrl,
      required this.ratingKinopoisk,
      required this.year,
      required this.description});
  final String? nameRu;
  final String nameOriginal;
  final String posterUrl;
  final int ratingKinopoisk;
  final int year;
  final String description;
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      nameRu: json['nameRu'],
      nameOriginal: json['nameOriginal'],
      posterUrl: json['posterUrl'],
      ratingKinopoisk: json['ratingKinopoisk'],
      year: json['year'],
      description: json['description'],
    );
  }
}
