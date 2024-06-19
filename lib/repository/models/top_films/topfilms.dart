class TopFilms {
  TopFilms({required this.nameRu, required this.posterUrl, required this.year});
  final String? nameRu;
  final String posterUrl;
  final int year;

  factory TopFilms.fromJson(Map<String, dynamic> json) {
    return TopFilms(
      nameRu: json['nameRu'],
      posterUrl: json['posterUrl'],
      year: json['year'],
    );
  }
}
