import 'package:flutter/material.dart';

class CarryVibeTheme {
  static final defaultTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xff4ab1b3),
      secondary: Color(0xFFED6B5E),
      inversePrimary: Color(0xFF78C4C5),
      error: Color(0xfffcb064),
      primaryContainer: Color(0xfff8f4f4),
    ),
    appBarTheme: const AppBarTheme(
        toolbarHeight: 65,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black),
        color: Color(0xFFFAFAFA),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black)),
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF28C1EA)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
    textTheme: const TextTheme(
      button: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Urbanist",),
      headline1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Urbanist",),
      headline2: TextStyle(
          fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Urbanist",),
      subtitle1: TextStyle(fontSize: 12.0, color: Colors.black, fontFamily: "Urbanist",),
      bodyText1: TextStyle(fontSize: 11.0, color: Colors.black, fontFamily: "Urbanist",),
    ),
  );
}