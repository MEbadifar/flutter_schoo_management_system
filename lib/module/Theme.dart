import 'package:flutter/material.dart';

enum AppTheme { Dark, Light }

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.Light: ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.blueAccent, brightness: Brightness.light),
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.grey[100],
    textTheme: TextTheme(headline1: TextStyle(color: Colors.grey[100])),
  ),
  AppTheme.Dark: ThemeData(
    primarySwatch: Colors.blueGrey,
    primaryColor: Color(0xFF294c60),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.lightBlueAccent,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.grey[800],
    bottomAppBarColor: Colors.grey[700],
    textTheme: TextTheme(headline1: TextStyle(color: Colors.white70)),
  ),
};
