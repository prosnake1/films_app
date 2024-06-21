import 'package:dio/dio.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/models/movie_info/movie.dart';
import 'package:films_app/repository/singletons/singleton.dart';
import 'package:get_it/get_it.dart';

class MovieInfoRepository implements AbstractMovieInfoRep {
  MovieInfoRepository({required this.dio});
  final Dio dio;
  static const String apiKey = 'cc8b4852-3a5c-441c-82e3-f67e5eb33fea';
  final Options _options = Options(
    headers: {
      "X-API-KEY": apiKey,
    },
  );
  @override
  Future<List<MovieInfo>> getMovieInfoList() async {
    try {
      final id = GetIt.I.get<MovieIdSingleton>().kinopoiskId;
      Response response = await dio.get(
          'https://kinopoiskapiunofficial.tech/api/v2.2/films/${id.toString()}',
          options: _options);
      final data = response.data;

      List<MovieInfo> movie = [
        MovieInfo(
          nameRu: data['nameRu'],
          nameOriginal: data['nameOriginal'],
          posterUrl: data['posterUrl'],
          ratingKinopoisk: data['ratingKinopoisk'],
          year: data['year'],
          description: data['description'],
          countries: data['countries'].map((e) => e['country']).toList(),
          genres: data['genres'].map((e) => e['genre']).toList(),
        )
      ];
      return movie;
    } catch (e) {
      throw Error();
    }
  }
}
