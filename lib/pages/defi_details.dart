import 'package:flutter/material.dart';
import 'package:zine/components/appbar.dart';
import 'package:zine/components/button.dart';
import 'package:zine/components/navigation_bar.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';
import 'dart:math' as math;
import 'package:share/share.dart';

class DefiDetails extends StatelessWidget {
  const DefiDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZineAppBar(),
      backgroundColor: backgroundTheme,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Manger Bio",
              style: CustomTextStyle.regular25(context),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greenZine,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/icons/hummingbird.png", width: 47),
                Padding(padding: EdgeInsets.only(left: 85)),
                Image.asset("assets/icons/drop.png", width: 27),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "750",
                      style: CustomTextStyle.bold19(context),
                    ),
                    Text(
                      "participants",
                      style: CustomTextStyle.regular15(context),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(left: 60)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "500",
                      style: CustomTextStyle.bold19(context),
                    ),
                    Text(
                      "gouttes",
                      style: CustomTextStyle.regular15(context),
                    ),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
            Center(
              child: Text(
                "Tu fais ta part bravo !",
                style: CustomTextStyle.regular15green(context),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Center(
              child: CustomButtonIcon(
                label: "Partager",
                icon: Icon(Icons.share),
                callback: () {
                  Share.share('check out my website https://example.com',
                      subject: 'Look what I made!');
                },
                backgroundColor: Colors.transparent,
                textColor: greenZine,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 35)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.alarm,
                        size: 25,
                      ),
                      Padding(padding: EdgeInsets.only(left: 15)),
                      Text(
                        "Pas de rappel défini",
                        style: CustomTextStyle.regular15(context),
                      ),
                    ],
                  ),
                  Transform.rotate(
                    angle: 180 * math.pi / 180,
                    child:
                        Icon(Icons.arrow_back_ios, size: 20, color: grayZine),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Pourquoi le faire ?",
                  style: CustomTextStyle.bold17(context),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  "En plus de contenir logiquement moins de pesticides mais aussi moins de métaux lourds (-48%), les produits biologiques contiennent  davantage de polyphénols (jusqu’à 60% de plus) et d’antioxydants que les produits conventionnels. C’est ce que montre une équipe internationale d’experts, dirigée par l’université de Newcastle au Royaume-Uni, dans un état de l’art sur les avantages et/ou désavantages nutritionnels, des cultures ou aliments à base de plantes cultivées en agriculture biologique (AB), face à ceux issus de l’agriculture conventionnelle.",
                  style: CustomTextStyle.regular15gray(context),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
            Center(
              child: CustomButton(
                text: "Annuler",
                callback: () {},
                backgroundColor: Colors.transparent,
                textColor: redZine,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
