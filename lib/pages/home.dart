import 'package:flutter/material.dart';
import 'package:zine/components/appbar.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            ZineAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Habitudes du moment",
                      style: Theme.of(context).textTheme.title,
                    ),
                    Padding(padding: EdgeInsets.only(top: 45)),
                    Column(children: <Widget>[
                      CardDefi(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      CardDefi(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      CardDefi(),
                    ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add-defi');
        },
        label: Text(
          'Ajouter un défi'.toUpperCase(),
          style: CustomTextStyle.bold13(context),
        ),
        backgroundColor: greenZine,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
