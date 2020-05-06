import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/_services.dart';
import 'package:zine/theme/constants.dart';
import 'package:provider/provider.dart';

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
    FutureBuilder(
      future: Globals.articelsRef.getData(),
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
      child: Text("Page de statistiques"),
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
    return Scaffold(
      appBar: ZineAppBar(),
      backgroundColor: backgroundTheme,
      body: Container(
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
      ),
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
