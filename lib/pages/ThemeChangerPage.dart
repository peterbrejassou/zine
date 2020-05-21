import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/services/ThemeChanger.dart';

class ThemeChangerPage extends StatelessWidget {
  const ThemeChangerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[
            Text(
              "Choissisez le thème à utiliser :",
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            RaisedButton(
              child: Text('Dark Theme'),
              onPressed: () => _themeChanger.setTheme(ThemeData.dark()),
              color: Colors.grey[900],
              textColor: Colors.white,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            RaisedButton(
              child: Text('Light Theme'),
              onPressed: () => _themeChanger.setTheme(ThemeData.light()),
              color: Colors.grey[200],
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
