import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/theme/constants.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZineAppBar(),
      backgroundColor: backgroundTheme,
      body: Container(
        child: Text("Friends page"),
      ),
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
