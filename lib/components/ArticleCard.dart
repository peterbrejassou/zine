import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Article.dart';
import 'package:zine/pages/ArticleDetailsPage.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/theme.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);

    Widget imageWidget;
    if (article.img == '' || article.img == null) {
      imageWidget = Image.asset("assets/default_img_article.png", width: 85);
    } else {
      imageWidget = Image.network(article.img ?? '', width: 85);
    }
    return GestureDetector(
      onTap: () {
        _bodyChanger.setBody(ArticleDetailsPage(article: article));
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
                  style: ZineTextStyle.regular12green(context),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 130,
                  child: Text(
                    article.title,
                    style: ZineTextStyle.bold16(context),
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
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text("3K", style: ZineTextStyle.regular15(context)),
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
