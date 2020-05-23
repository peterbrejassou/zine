import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zine/constants.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/services/ThemeChanger.dart';

class ZineBottomNavigationBar extends StatefulWidget {
  ZineBottomNavigationBar({Key key}) : super(key: key);

  @override
  _ZineBottomNavigationBarState createState() =>
      _ZineBottomNavigationBarState();
}

class _ZineBottomNavigationBarState extends State<ZineBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final body = Provider.of<BodyChanger>(context);
    final theme = Provider.of<ThemeChanger>(context);
    final brightness = theme.getThemeBrightness();

    return BottomNavigationBar(
      selectedItemColor: greenZine,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          body.setBody(navPageItems[index]);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.checkSquare),
          title: Text("Accueil"),
          backgroundColor:
              brightness == Brightness.dark ? Colors.black : Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.newspaper),
          title: Text("Infos"),
          backgroundColor:
              brightness == Brightness.dark ? Colors.black : Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.gamepad),
          title: Text("Jeu"),
          backgroundColor:
              brightness == Brightness.dark ? Colors.black : Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.globe),
          title: Text("Friends"),
          backgroundColor:
              brightness == Brightness.dark ? Colors.black : Colors.white,
        ),
      ],
    );
  }
}
