import 'dart:async';

import 'package:dio/dio.dart';
import 'package:films_app/pages/collection/collection_page.dart';
import 'package:films_app/pages/login/login_page.dart';
import 'package:films_app/pages/pages.dart';
import 'package:films_app/pages/sign_up/sign_up_page.dart';
import 'package:films_app/repository/di/di_container.dart';
import 'package:films_app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
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
  runZonedGuarded(() => runApp(const MovieApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/home/search': (context) => const SearchPage(),
        '/movie': (context) => const MoviePage(),
        '/login': (context) => const LoginPage(),
        '/login/sign-up': (context) => const SignUpPage(),
        '/home/collection': (context) => const CollectionPage(),
      },
      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>()),
      ],
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
    );
  }
}
