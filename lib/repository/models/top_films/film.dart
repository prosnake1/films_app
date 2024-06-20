class Film {
  Film({
    required this.nameRu,
    required this.posterUrl,
    required this.year,
  });
  final String? nameRu;
  final String posterUrl;
  final int year;

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      nameRu: json['nameRu'],
      posterUrl: json['posterUrl'],
      year: json['year'],
    );
  }
}
