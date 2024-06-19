import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.white,
  appBarTheme: const AppBarTheme(centerTitle: true),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.rubik(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    ),
    labelLarge: GoogleFonts.rubik(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    ),
  ),
  useMaterial3: true,
);
