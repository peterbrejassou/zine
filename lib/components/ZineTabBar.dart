import 'package:flutter/material.dart';
import 'package:zine/constants.dart';
import 'package:zine/theme.dart';

class ZineTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;
  final List<Widget> tabviews;

  const ZineTabBar({
    @required this.tabController,
    @required this.tabs,
    @required this.tabviews,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        TabBar(
          controller: tabController,
          indicatorColor: greenZine,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: greenZine,
          labelStyle: ZineTextStyle.bold20(context),
          labelPadding: EdgeInsets.symmetric(horizontal: 50),
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle: ZineTextStyle.bold20(context),
          isScrollable: true,
          tabs: tabs,
        ),
        Container(
          height: screenHeight - 238,
          margin: EdgeInsets.only(top: 20),
          child: TabBarView(
            controller: tabController,
            children: tabviews,
          ),
        )
      ],
    );
  }
}
