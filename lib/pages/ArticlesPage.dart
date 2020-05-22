import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/database/ArticleService.dart';

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> tabs = [
    Tab(text: "Articles"),
    Tab(text: "Statistiques"),
  ];

  List<Widget> tabviews = [
    /* 
     * FIRST TAB
     */
    StreamBuilder(
      stream: ArticleService().streamData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Article> articles = snapshot.data;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              Article article = articles[index];
              return ArticleCard(article: article);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return ZineLoader();
        }
      },
    ),

    /* 
     * SECOND TAB
     */
    SingleChildScrollView(
      child: Center(
        child: Text("Section en développement..."),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 3)),
          ZineTabBar(
            tabController: _tabController,
            tabs: tabs,
            tabviews: tabviews,
          )
        ],
      ),
    );
  }
}
