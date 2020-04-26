import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zine/theme/constants.dart';

class ZineBottomNavigationBar extends BottomNavigationBar {
  ZineBottomNavigationBar({
    @required int selectedIndex,
    @required onTap,
  }) : super(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          selectedItemColor: greenZine,
          selectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.checkSquare),
              title: Text("Accueil"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.newspaper),
              title: Text("Accueil"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gamepad),
              title: Text("Accueil"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.globe),
              title: Text("Accueil"),
            ),
          ],
        );
}
