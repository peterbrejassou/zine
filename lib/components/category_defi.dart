import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/theme/constants.dart';

class CategoryDefi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconCircleBackground(
          icon: 'user.png',
          color: greenZine,
          width: 65,
          padding: 12,
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
