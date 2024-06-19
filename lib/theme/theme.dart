import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.black, width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: GoogleFonts.rubik(
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ))),
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
