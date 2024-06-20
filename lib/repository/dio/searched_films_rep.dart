import 'package:dio/dio.dart';
import 'package:films_app/repository/models/searched_films/searchedfilm.dart';
import 'package:films_app/repository/models/searched_films/searchedfilms.dart';
import 'package:films_app/repository/singleton/keyword.dart';
import 'package:get_it/get_it.dart';

final KeywordSingleton keywordSingleton = GetIt.I.get<KeywordSingleton>();
String keyword = keywordSingleton.keyword;

class SearchedFilmsRepository {
  final Dio dio = Dio();

  static const String apiKey = 'cc8b4852-3a5c-441c-82e3-f67e5eb33fea';
  Map<String, String> queryParams = {
    'keyword': keyword,
  };
  final Options _options = Options(
    headers: {
      "X-API-KEY": apiKey,
    },
  );
  Future<List<SearchedFilms>> getFilmsList() async {
    try {
      Response response = await dio.get(
          'https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=%20&page=2',
          options: _options,
          queryParameters: queryParams);
      final data = response.data;
      List<SearchedFilm> films = (data['films'] as List)
          .map((json) => SearchedFilm.fromJson(json))
          .toList();
      List<SearchedFilms> result = [
        SearchedFilms(
            pagesCount: data['pagesCount'],
            searchFilmsCountResult: data['searchFilmsCountResult'],
            films: films)
      ];
      return result;
    } catch (e) {
      throw Error();
    }
  }
}
