import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/pages/_pages.dart';
import 'package:zine/services/BodyChanger.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);

    return SingleChildScrollView(
      child: Container(
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
            ZineButton(
              label: "Boutique",
              callback: () {
                _bodyChanger.setBody(ShopPage());
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
          ],
        ),
      ),
    );
  }
}
