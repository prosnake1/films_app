import 'package:dio/dio.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/dio/top_films_rep.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator
      .registerSingleton<AbstractTopFilmsRep>(TopFilmsRepository(dio: Dio()));
}
