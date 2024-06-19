import 'package:dio/dio.dart';
import 'package:films_app/repository/models/top_films/topfilms.dart';

class ApiService {
  static const String apiKey = 'cc8b4852-3a5c-441c-82e3-f67e5eb33fea';
  Dio dioA = Dio(
    BaseOptions(
      headers: {"X-API-KEY": apiKey},
    ),
  );
  Future<List<TopFilms>> getTopFilmsList() async {
    // лист из топ 10 фильмов
    try {
      Response response = await dioA.get(
          'https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type=TOP_POPULAR_MOVIES&page=1');
      List<TopFilms> films = (response.data['items'] as List)
          .map((json) => TopFilms.fromJson(json))
          .toList();
      if (films.length > 10) {
        for (int i = films.length - 10; i > 0; i--) {
          // оставляем топ 10
          films.removeLast();
        }
      }
      return films;
    } catch (e) {
      throw Exception('Something went Wrong! $e');
    }
  }
}
