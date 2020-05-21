import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/pages/add_defi/AddDefiStep2.dart';
import 'package:zine/services/BodyChanger.dart';

class CategoryDefi extends StatelessWidget {
  final Category category;
  const CategoryDefi({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);

    return GestureDetector(
      onTap: () {
        _bodyChanger.setBody(AddDefiStep2(category: category));
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
