import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../components/constants.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: primarySwatch,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    color: HexColor('333739'),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('333739'),
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333539'),
    selectedItemColor: Colors.deepPurple,
    unselectedIconTheme: const IconThemeData(color: Colors.grey),
    unselectedLabelStyle: const TextStyle(
      color: Colors.grey,
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
  ),
  fontFamily: 'Roboto',
);
ThemeData lightTheme = ThemeData(
  colorScheme: primarySwatch,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.deepPurple,
    unselectedLabelStyle: TextStyle(
      color: Colors.grey,
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
  ),
  fontFamily: 'Roboto',
);