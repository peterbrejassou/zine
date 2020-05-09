import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zine/theme/constants.dart';

class ZineBottomNavigationBar extends StatefulWidget {
  @override
  _ZineBottomNavigationBarState createState() =>
      _ZineBottomNavigationBarState();
}

class _ZineBottomNavigationBarState extends State<ZineBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacementNamed(context, bottomBarItems[_selectedIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: backgroundTheme,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      selectedItemColor: greenZine,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        _onItemTapped(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.checkSquare),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.newspaper),
          title: Text("News"),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.gamepad),
          title: Text("Game"),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.globe),
          title: Text("Friends"),
        ),
      ],
    );
  }
}
