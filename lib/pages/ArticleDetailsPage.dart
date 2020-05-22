import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Article.dart';
import 'package:share/share.dart';
import 'package:zine/pages/ArticlesPage.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/theme.dart';

class ArticleDetailsPage extends StatefulWidget {
  final Article article;
  const ArticleDetailsPage({Key key, this.article}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);

    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        changeIconLike() {
          if (widget.article.likes.contains(snapshot.data.uid)) {
            return Icon(
              Icons.favorite,
              color: Colors.red,
            );
          } else {
            return Icon(
              Icons.favorite_border,
              color: Colors.white,
            );
          }
        }

        if (snapshot.hasData) {
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
                          _bodyChanger.setBody(ArticlesPage());
                        },
                        child: Container(
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      Container(
                        width: 240,
                        child: Text(
                          widget.article.title,
                          style: ZineTextStyle.regular20(context),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          changeIconLike(),
                          Text(
                            widget.article.likes.length.toString(),
                            style: ZineTextStyle.regular12(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.network(
                  widget.article.img,
                  height: 200,
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                Text(
                  widget.article.content,
                  style: ZineTextStyle.regular15gray(context),
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                ZineButtonIcon(
                  label: "Partager",
                  icon: Icon(Icons.share),
                  callback: () {
                    Share.share(
                      'Voici un article interéssant disponible sur Zine : ' +
                          widget.article.title,
                    );
                  },
                  backgroundColor: Colors.transparent,
                  textColor: greenZine,
                )
              ],
            ),
          );
        } else {
          return ZineLoader();
        }
      },
    );
  }
}
