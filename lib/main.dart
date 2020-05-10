import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/pages/news.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';
import 'package:zine/services/_services.dart';
import 'package:zine/pages/_pages.dart';

void main() => runApp(ZineApp());

class ZineApp extends StatefulWidget {
  @override
  _ZineAppState createState() => _ZineAppState();
}

class _ZineAppState extends State<ZineApp> {
  int _selectedIndex = 0;

  Widget handleAuthentification() {
    return StreamBuilder<FirebaseUser>(
      stream: AuthService().streamUser,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return (!snapshot.hasData) ? LoginPage() : buildMainScreen();
      },
    );
  }

  Widget buildMainScreen() {
    return Scaffold(
      appBar: ZineAppBar(),
      backgroundColor: backgroundTheme,
      body: navPageItems[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundTheme,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedItemColor: greenZine,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => RegisterPage(),
        '/reset-password': (context) => ResetPasswordPage(),
        '/home': (context) => HomePage(),
        '/add-defi-step1': (context) => AddDefiStep1(),
        '/add-defi-step2': (context) => AddDefiStep2(),
        '/defi-details': (context) => DefiDetails(),
        '/news': (context) => NewsPage(),
        '/article': (context) => ArticlePage(),
        '/game': (context) => GamePage(),
        '/boutique': (context) => BoutiquePage(),
        '/friends': (context) => FriendsPage(),
        '/profile': (context) => ProfilePage(),
        '/associations': (context) => AssociationsPage(),
        '/association-details': (context) => AssociationDetailsPage(),
        '/donate': (context) => DonatePage(),
      },
      theme: buildThemeData(),
      home: handleAuthentification(),
    );
  }
}
