import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/article_card.dart';
import 'package:zine/models/_models.dart';

class ArticlesList extends StatefulWidget {
  ArticlesList({Key key}) : super(key: key);

  @override
  _ArticlesListState createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    final articles = Provider.of<List<Article>>(context);
    print(articles[0].title);

    /*  return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleCard(article: articles[index]);
      },
    ); */
  }
}
