import 'package:films_app/pages/pages.dart';
import 'package:films_app/repository/di/di_container.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const HomePage(),
    );
  }
}
