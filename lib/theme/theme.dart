import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primarySwatch: greenZineMaterial,
    primaryColor: greenZineMaterial,
    accentColor: greenZineMaterial,
    fontFamily: 'ProductSans',
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      body1: TextStyle(fontSize: 15),
      body2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: greenZine,
      ),
      button: TextStyle(fontSize: 15),
    ),
  );
}
