import 'package:dio/dio.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/dio/movie_rep.dart';
import 'package:films_app/repository/dio/searched_films_rep.dart';
import 'package:films_app/repository/dio/top_films_rep.dart';
import 'package:films_app/repository/singletons/singleton.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator
      .registerSingleton<AbstractTopFilmsRep>(TopFilmsRepository(dio: Dio()));
  locator.registerSingleton<KeywordSingleton>(KeywordSingleton(''));
  locator.registerSingleton<CurrentPageSingleton>(CurrentPageSingleton(1));
  locator.registerSingleton<AbstractSearchedFilmsRep>(
      SearchedFilmsRepository(dio: Dio()));
  locator.registerSingleton<PagesCountSingleton>(PagesCountSingleton(0));
  locator.registerSingleton<MovieIdSingleton>(MovieIdSingleton(0));
  locator
      .registerSingleton<AbstractMovieInfoRep>(MovieInfoRepository(dio: Dio()));
  locator.registerLazySingleton<FilmNameSingleton>(() => FilmNameSingleton(''));
  locator.registerLazySingleton<DbMovieId>(() => DbMovieId());
  locator.registerLazySingleton<IsAddedSingleton>(() => IsAddedSingleton());
}
