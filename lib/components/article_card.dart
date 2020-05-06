import 'package:flutter/material.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (article.img == '' || article.img == null) {
      imageWidget = Image.asset("assets/default_img_article.png", width: 85);
    } else {
      imageWidget = Image.network(article.img ?? '', width: 85);
    }
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/article', arguments: article);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            imageWidget,
            Padding(padding: EdgeInsets.only(left: 15)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.category.toUpperCase(),
                  style: CustomTextStyle.regular12green(context),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 130,
                  child: Text(
                    article.title,
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
      ),
    );
  }
}
