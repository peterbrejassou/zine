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
      title: TextStyle(fontSize: 25),
      headline: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      subtitle: TextStyle(fontSize: 13, color: Colors.white54),
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

class CustomTextStyle {
  static TextStyle green20(BuildContext context) {
    return Theme.of(context).textTheme.headline.copyWith(color: greenZine);
  }

  static TextStyle bold18(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .body1
        .copyWith(fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle regular18(BuildContext context) {
    return Theme.of(context).textTheme.body1.copyWith(fontSize: 18);
  }
}
