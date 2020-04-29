import 'package:flutter/material.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class NestedTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> tabviews;

  NestedTabBar({@required this.tabs, @required this.tabviews});

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: greenZine,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: greenZine,
          labelStyle: CustomTextStyle.bold20(context),
          labelPadding: EdgeInsets.symmetric(horizontal: 50),
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle: CustomTextStyle.bold20(context),
          isScrollable: true,
          tabs: widget.tabs,
        ),
        Container(
          height: screenHeight * 0.675,
          margin: EdgeInsets.only(top: 20),
          child: TabBarView(
            controller: _nestedTabController,
            children: widget.tabviews,
          ),
        )
      ],
    );
  }
}
