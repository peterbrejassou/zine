import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/_services.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
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
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (!snap.hasData) {
          return ZineLoader();
        }
        List<Article> articles = snap.data;
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) {
            Article article = articles[index];
            return ArticleCard(article: article);
          },
        );
      },
    ),

    /* 
     * SECOND TAB
     */
    SingleChildScrollView(
      child: Center(
        child: Text("Page de statistiques"),
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
          CustomTabBar(
            tabController: _tabController,
            tabs: tabs,
            tabviews: tabviews,
          )
        ],
      ),
    );
  }
}
