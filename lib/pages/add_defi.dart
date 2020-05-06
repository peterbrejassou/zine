import 'package:flutter/material.dart';
import 'package:zine/components/appbar.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/components/category_defi.dart';
import 'package:zine/components/navigation_bar.dart';
import 'package:zine/theme/constants.dart';

class AddDefi extends StatefulWidget {
  @override
  _AddDefiState createState() => _AddDefiState();
}

class _AddDefiState extends State<AddDefi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundTheme,
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            ZineAppBar(),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Quel défi souhaitez-vous démarrer ?",
                      style: Theme.of(context).textTheme.title,
                    ),
                    Padding(padding: EdgeInsets.only(top: 45)),
                    Column(children: <Widget>[
                      CategoryDefi(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      CategoryDefi(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      CategoryDefi(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      CategoryDefi(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      CategoryDefi(),
                    ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
