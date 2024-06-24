import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/dio/movie_rep.dart';
import 'package:films_app/repository/dio/searched_films_rep.dart';
import 'package:films_app/repository/dio/top_films_rep.dart';
import 'package:films_app/repository/singletons/singleton.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup({required dio}) {
  locator.registerLazySingleton<AbstractTopFilmsRep>(
      () => TopFilmsRepository(dio: dio));
  locator.registerLazySingleton<KeywordSingleton>(() => KeywordSingleton(''));
  locator.registerLazySingleton<CurrentPageSingleton>(
      () => CurrentPageSingleton(1));
  locator.registerLazySingleton<AbstractSearchedFilmsRep>(
      () => SearchedFilmsRepository(dio: dio));
  locator
      .registerLazySingleton<PagesCountSingleton>(() => PagesCountSingleton(0));
  locator.registerLazySingleton<MovieIdSingleton>(() => MovieIdSingleton(0));
  locator.registerLazySingleton<AbstractMovieInfoRep>(
      () => MovieInfoRepository(dio: dio));
  locator.registerLazySingleton<FilmNameSingleton>(() => FilmNameSingleton(''));
  locator.registerLazySingleton<DbMovieId>(() => DbMovieId());
  locator.registerLazySingleton<IsAddedSingleton>(() => IsAddedSingleton());
  locator.registerLazySingleton<PosterSingleton>(() => PosterSingleton(''));
}
