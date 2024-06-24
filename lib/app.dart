import 'package:films_app/pages/pages.dart';
import 'package:films_app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
