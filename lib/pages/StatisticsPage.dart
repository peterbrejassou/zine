import 'package:flutter/material.dart';
import 'package:zine/components/StatCard.dart';
import 'package:zine/constants.dart';
import 'package:zine/theme.dart';
import 'dart:math' as math;

class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Votre impact écologique",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 15,
          ),
          StatCard(number: '25', text: 'Emission de CO2 économisés (kg)'),
          SizedBox(height: 10),
          StatCard(number: '260', text: 'Eau économisée (litres)'),
          SizedBox(height: 10),
          StatCard(number: '550', text: 'Énergie économisée (kWh)'),
          SizedBox(height: 30),
          Text(
            "Vos efforts permettent de sauver toute une famille de panda. Soyez fier, bravo !",
            style: ZineTextStyle.bold15green(context),
          ),
          SizedBox(height: 50),
          Text(
            "Statistiques générales",
            style: Theme.of(context).textTheme.headline1,
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StatGlobalCard(
                  icon: Icons.cloud,
                  text: 'Environnement',
                ),
                StatGlobalCard(
                  icon: Icons.lightbulb_outline,
                  text: 'Énergie',
                ),
                StatGlobalCard(
                  icon: Icons.public,
                  text: 'Population',
                ),
                StatGlobalCard(
                  icon: Icons.attach_money,
                  text: 'Économie',
                ),
              ],
            ),
          )
        ],
      ),
    );

    /* return SingleChildScrollView(
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
    ); */
  }
}

class StatGlobalCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const StatGlobalCard({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: grayZine)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                color: greenZine,
                size: 25,
              ),
              SizedBox(width: 30),
              Text(
                text,
                style: ZineTextStyle.regular15(context),
              ),
            ],
          ),
          Transform.rotate(
            angle: math.pi,
            child: Icon(Icons.arrow_back_ios, size: 20, color: grayZine),
          ),
        ],
      ),
    );
  }
}
