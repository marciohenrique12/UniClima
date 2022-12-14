import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.blueGrey[700]),
    textTheme: const TextTheme(
        headline3: TextStyle(fontSize: 23, fontWeight: FontWeight.w200),
        headline4: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  );
}
