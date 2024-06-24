import 'dart:async';

import 'package:dio/dio.dart';
import 'package:films_app/app.dart';
import 'package:films_app/repository/di/di_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  runZonedGuarded(() async {
    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton(talker);
    GetIt.I<Talker>().debug('Talker started...');
    final dio = Dio();
    dio.interceptors.add(TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(printResponseData: false)));
    Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: const TalkerBlocLoggerSettings(
            printStateFullData: false, printEventFullData: false));
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    setup(dio: dio);
    FlutterError.onError =
        (details) => GetIt.I<Talker>().handle(details.exception, details.stack);
    runApp(const MovieApp());
  }, (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}
