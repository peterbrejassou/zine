import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zine/constants.dart';
import 'package:zine/services/BodyChanger.dart';

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
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.newspaper),
          title: Text("Infos"),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.gamepad),
          title: Text("Jeu"),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.globe),
          title: Text("Friends"),
        ),
      ],
    );
  }
}
