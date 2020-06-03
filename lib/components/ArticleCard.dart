import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/ZineLoader.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Article.dart';
import 'package:zine/pages/ArticleDetailsPage.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/services/ThemeChanger.dart';
import 'package:zine/theme.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);
    final theme = Provider.of<ThemeChanger>(context);
    final brightness = theme.getThemeBrightness();
    bool iconLikeFull = false;

    Widget imageWidget;
    if (article.img == '' || article.img == null) {
      imageWidget = Image.asset("assets/default_img_article.png", width: 85);
    } else {
      imageWidget = Image.network(article.img ?? '', width: 85);
    }

    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          Widget changeIconLike() {
            if (article.likes.contains(snapshot.data.uid)) {
              iconLikeFull = true;
              return Icon(
                Icons.favorite,
                color: Colors.red,
              );
            } else {
              return Icon(
                Icons.favorite_border,
                color: (brightness == Brightness.dark)
                    ? Colors.white
                    : Colors.black,
              );
            }
          }

          return GestureDetector(
            onTap: () {
              _bodyChanger.setBody(ArticleDetailsPage(
                  article: article, iconLikeFull: iconLikeFull));
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
                          changeIconLike(),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Text(article.likes.length.toString(),
                              style: ZineTextStyle.regular15(context)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return ZineLoader();
        }
      },
    );
  }
}
