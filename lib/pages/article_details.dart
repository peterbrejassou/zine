import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/article.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';
import 'package:share/share.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context).settings.arguments;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Container(
                  width: 240,
                  child: Text(
                    article.title,
                    style: CustomTextStyle.regular20(context),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    Text(
                      article.likes.toString(),
                      style: CustomTextStyle.regular12(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.network(
            article.img,
            height: 200,
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(
            article.content,
            style: CustomTextStyle.regular15gray(context),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          CustomButtonIcon(
            label: "Partager",
            icon: Icon(Icons.share),
            callback: () {
              Share.share(
                'Voici un article interéssant disponible sur Zine : ' +
                    article.title,
              );
            },
            backgroundColor: Colors.transparent,
            textColor: greenZine,
          )
        ],
      ),
    );
  }
}
