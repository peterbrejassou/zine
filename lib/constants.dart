import 'package:flutter/material.dart';
import 'package:zine/pages/_pages.dart';

// BottomNavigationBarItems
final List<Widget> navPageItems = [
  HomePage(),
  ArticlesPage(),
  GamePage(),
  FriendsPage(),
];

// Material Colors
Map<int, Color> color = {
  50: Color.fromRGBO(79, 178, 134, .1),
  100: Color.fromRGBO(79, 178, 134, .2),
  200: Color.fromRGBO(79, 178, 134, .3),
  300: Color.fromRGBO(79, 178, 134, .4),
  400: Color.fromRGBO(79, 178, 134, .5),
  500: Color.fromRGBO(79, 178, 134, .6),
  600: Color.fromRGBO(79, 178, 134, .7),
  700: Color.fromRGBO(79, 178, 134, .8),
  800: Color.fromRGBO(79, 178, 134, .9),
  900: Color.fromRGBO(79, 178, 134, 1),
};
MaterialColor greenZineMaterial = MaterialColor(0xFF4FB286, color);

// Colors
const Color backgroundTheme = const Color(0xFF000000);
const Color greenZine = const Color(0xFF4FB286);
const Color grayZine = const Color(0xFF626262);
const Color grayLightZine = const Color(0xFF828282);
const Color redZine = const Color(0xFFB24F4F);
const Color whiteZine = const Color(0xFFFFFFFF);
const Color blueOcean = const Color(0xFF4C908F);
const Color yellowDrought = const Color(0xFF908A4C);
const Color blueClimate = const Color(0xFF4C6B90);
const Color redOzone = const Color(0xFF904C4C);
const Color grayLocked = const Color(0xFF333333);
