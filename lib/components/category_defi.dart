import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/theme/constants.dart';

class CategoryDefi extends StatelessWidget {
  final Category category;
  const CategoryDefi({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/add-defi-step2', arguments: category);
      },
      child: Row(
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
              Text(category.title),
              Text("10 défis", style: Theme.of(context).textTheme.subtitle1),
            ],
          )
        ],
      ),
    );
  }
}
