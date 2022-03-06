import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData light() => ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepOrange,
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 16,
      color: Colors.black,
      height: 1.1,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrangeAccent,
    backgroundColor: Colors.white,
    elevation: 20.0,
  ),
);
ThemeData dark() => ThemeData(
  scaffoldBackgroundColor: HexColor('121212'),
  primarySwatch: Colors.deepOrange,
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 16,
      color: Colors.white,
      height: 1.1,
    ),
  ),
  appBarTheme: AppBarTheme(
    color: HexColor('121212'),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('121212'),
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrangeAccent,
    unselectedItemColor: Colors.grey,
    backgroundColor: HexColor('121212'),
    elevation: 20.0,
  ),
);