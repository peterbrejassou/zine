import 'package:flutter/material.dart';
import 'package:zine/components/appbar.dart';
import 'package:zine/components/navigation_bar.dart';

class DefiDetails extends StatelessWidget {
  const DefiDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            ZineAppBar(),
            SingleChildScrollView(
              child: Container(),
            ),
            ZineBottomNavigationBar(),
          ],
        ),
      ),
      //bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
