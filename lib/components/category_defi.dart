import 'package:flutter/material.dart';
import 'package:zine/theme/constants.dart';

class CategoryDefi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: greenZine,
          radius: 30,
        ),
        Padding(padding: EdgeInsets.only(left: 15)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Environnement"),
            Text("10 défis", style: Theme.of(context).textTheme.subtitle),
          ],
        )
      ],
    );
  }
}
