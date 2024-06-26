import 'package:dio/dio.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/models/searched_films/searchedfilm.dart';
import 'package:films_app/repository/singletons/singleton.dart';
import 'package:get_it/get_it.dart';

class SearchedFilmsRepository implements AbstractSearchedFilmsRep {
  SearchedFilmsRepository({required this.dio});
  final Dio dio;

  static const String apiKey = 'cc8b4852-3a5c-441c-82e3-f67e5eb33fea';
  final Options _options = Options(
    headers: {
      "X-API-KEY": apiKey,
    },
  );

  @override
  Future<List<SearchedFilm>> getFilmsList() async {
    try {
      String keyword = GetIt.I.get<KeywordSingleton>().keyword;
      String page = GetIt.I.get<CurrentPageSingleton>().page.toString();
      Map<String, String> queryParams = {
        'keyword': keyword,
      };
      Response response = await dio.get(
          'https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=%20&page=$page',
          options: _options,
          queryParameters: queryParams);
      final data = response.data;
      GetIt.I.get<PagesCountSingleton>().updateValue(data['pagesCount']);
      List<SearchedFilm> films = (data['films'] as List)
          .map((json) => SearchedFilm.fromJson(json))
          .toList();
      return films;
    } catch (e) {
      throw Error();
    }
  }
}
