import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/services/ThemeChanger.dart';
import 'constants.dart';

ThemeData buildThemeData(brightness) {
  return ThemeData(
    primarySwatch: greenZineMaterial,
    scaffoldBackgroundColor:
        brightness == Brightness.dark ? Colors.black : Colors.white,
    primaryColor: greenZineMaterial,
    accentColor: greenZineMaterial,
    fontFamily: 'ProductSans',
    brightness: brightness,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        color: (brightness == Brightness.dark) ? Colors.white : Colors.black,
      ),
      headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontSize: 13, color: grayLightZine),
      bodyText1: TextStyle(
        fontSize: 15,
      ),
      bodyText2: TextStyle(
        fontSize: 15,
        color: greenZine,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(fontSize: 15),
    ),
  );
}

class ZineTextStyle {
  static TextStyle subphrase(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: 11, fontStyle: FontStyle.italic, color: grayZine);
  }

  static TextStyle green20(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(color: greenZine);
  }

  static TextStyle buttonText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
  }

  static TextStyle bold13(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bold15(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 15,
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

  static TextStyle regular13grayunderline(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 13,
          color: Colors.grey,
          decoration: TextDecoration.underline,
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

  static TextStyle regular25green(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 25,
          color: greenZine,
        );
  }
}
