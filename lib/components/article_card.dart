import 'package:flutter/material.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class ArticleCard extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String likes;

  const ArticleCard(
      {Key key, this.image, this.category, this.title, this.likes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Image.asset(
            image,
            width: 85,
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Manger Bio".toUpperCase(),
                style: CustomTextStyle.regular12green(context),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 130,
                child: Text(
                  "La saisonnalité des fruits et légumes",
                  style: CustomTextStyle.bold16(context),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 6)),
              Container(
                height: 3,
                width: 30,
                color: greenZine,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    size: 20,
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Text("3K"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
