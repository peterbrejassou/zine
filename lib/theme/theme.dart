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
      headline1: TextStyle(fontSize: 25, color: Colors.white),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle1: TextStyle(fontSize: 13, color: Colors.white),
      bodyText1: TextStyle(fontSize: 15, color: Colors.white),
      bodyText2: TextStyle(
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
    return Theme.of(context).textTheme.headline1.copyWith(color: greenZine);
  }

  static TextStyle bold13(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bold15green(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: greenZine,
        );
  }

  static TextStyle bold16(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bold17(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bold18(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bold19(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bold20(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bold20green(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: greenZine,
        );
  }

  static TextStyle regular12(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 12,
        );
  }

  static TextStyle regular12green(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 12,
          color: greenZine,
        );
  }

  static TextStyle regular15(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 15);
  }

  static TextStyle regular15gray(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 15,
          color: Colors.grey,
          height: 1.4,
        );
  }

  static TextStyle regular15black(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 15,
          color: Colors.black,
        );
  }

  static TextStyle regular15green(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 15,
          color: greenZine,
        );
  }

  static TextStyle regular16(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16);
  }

  static TextStyle regular18(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18);
  }

  static TextStyle regular20(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20);
  }

  static TextStyle regular25(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25);
  }
}
