import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/components/progress_bar_game.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 45),
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/earth.png",
            width: 150,
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          ProgressBarGame(
            title: "Taux de forestation",
            color: greenZine,
            percent: 0.75,
          ),
          ProgressBarGame(
            title: "Pollution des océans",
            color: blueOcean,
            percent: 0.25,
          ),
          ProgressBarGame(
            title: "Taux de sécheresse",
            color: yellowDrought,
            percent: 0.15,
          ),
          ProgressBarGame(
            title: "Bien-être climatique",
            color: blueClimate,
            percent: 0.90,
          ),
          ProgressBarGame(
            title: "État de la couche d'ozone",
            color: redOzone,
            percent: 0.35,
          ),
          Padding(padding: EdgeInsets.only(top: 40)),
          CustomButton(
            label: "Boutique",
            callback: () {
              Navigator.pushNamed(context, '/boutique');
            },
          ),
        ],
      ),
    );
  }
}
