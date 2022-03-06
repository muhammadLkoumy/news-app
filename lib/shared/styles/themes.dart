import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData light() => ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepOrange,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      letterSpacing: 1.2,
      fontFamily: 'Rowdies',
      height: 1.1,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey.shade600,
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 18,
      color: Colors.black,
      height: 1.1,
    ),
  ),
);
ThemeData dark() => ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    color: HexColor('121212'),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('121212'),
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      letterSpacing: 1.2,
      fontFamily: 'Rowdies',
      height: 1.1,
    ),
  ),
  scaffoldBackgroundColor: HexColor('121212'),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('121212'),
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 18,
      color: Colors.white,
      height: 1.1,
    ),
  ),
);