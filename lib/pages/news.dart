import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

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
    StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ArticleCard(
                  image: "assets/logo_zine.png",
                  category: "Manger Bio",
                  title: "La saisonnalité des fruits et légumes",
                  likes: "3K",
                ),
                ArticleCard(
                  image: "assets/logo_zine.png",
                  category: "Manger Bio",
                  title: "La saisonnalité des fruits et légumes",
                  likes: "3K",
                ),
                ArticleCard(
                  image: "assets/logo_zine.png",
                  category: "Manger Bio",
                  title: "La saisonnalité des fruits et légumes",
                  likes: "3K",
                ),
                ArticleCard(
                  image: "assets/logo_zine.png",
                  category: "Manger Bio",
                  title: "La saisonnalité des fruits et légumes",
                  likes: "3K",
                ),
                ArticleCard(
                  image: "assets/logo_zine.png",
                  category: "Manger Bio",
                  title: "La saisonnalité des fruits et légumes",
                  likes: "3K",
                ),
              ],
            ),
          );
        }),
    SingleChildScrollView(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            ZineAppBar(),
            Padding(padding: EdgeInsets.only(top: 10)),
            NestedTabBar(tabs: tabs, tabviews: tabviews),
            ZineBottomNavigationBar(),
          ],
        ),
      ),
      //bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
