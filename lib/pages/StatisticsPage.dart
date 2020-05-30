import 'package:flutter/material.dart';
import 'package:zine/constants.dart';

class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Text(
          "Page statistiques en développement...\nDisponible dans une prochaine mise à jour.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: grayLightZine,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
