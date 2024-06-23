import 'package:films_app/pages/login/login_page.dart';
import 'package:films_app/pages/pages.dart';
import 'package:films_app/pages/sign_up/sign_up_page.dart';
import 'package:films_app/repository/di/di_container.dart';
import 'package:films_app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MovieApp());
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
        '/search': (context) => const SearchPage(),
        '/movie': (context) => const MoviePage(),
        '/login': (context) => const LoginPage(),
        '/login/sign-up': (context) => const SignUpPage(),
      },
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
    );
  }
}
