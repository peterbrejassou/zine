import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Defi.dart';
import 'package:zine/theme.dart';
import 'dart:math' as math;
import 'package:share/share.dart';

class DefiDetails extends StatefulWidget {
  final Defi defi;
  final bool newDefi;

  DefiDetails({Key key, this.defi, this.newDefi}) : super(key: key);

  @override
  _DefiDetailsState createState() => _DefiDetailsState();
}

class _DefiDetailsState extends State<DefiDetails> {
  @override
  Widget build(BuildContext context) {
    int totalPointsDefi = 0;
    widget.defi.steps.forEach((step) {
      totalPointsDefi += step.points;
    });
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.defi.title,
            style: ZineTextStyle.regular25(context),
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
                    widget.defi.nbParticipants.toString(),
                    style: ZineTextStyle.bold19(context),
                  ),
                  Text(
                    "participants",
                    style: ZineTextStyle.regular15(context),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 60)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    totalPointsDefi.toString(),
                    style: ZineTextStyle.bold19(context),
                  ),
                  Text(
                    "gouttes",
                    style: ZineTextStyle.regular15(context),
                  ),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          _buildConditionNewDefi(widget.newDefi, widget.defi, context),
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
                      style: ZineTextStyle.regular15(context),
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: Icon(Icons.arrow_back_ios, size: 20, color: grayZine),
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
                style: ZineTextStyle.bold17(context),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                widget.defi.description,
                style: ZineTextStyle.regular15gray(context),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Center(
            child: ZineButton(
              label: "Annuler",
              callback: () {},
              backgroundColor: Colors.transparent,
              textColor: redZine,
              borderColor: redZine,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildConditionNewDefi(bool newDefi, Defi defi, BuildContext context) {
  if (newDefi == true) {
    return Center(
      child: ZineButton(
          label: "Faire ma part",
          callback: () {
            //UserService().addDefi(defi);
          }),
    );
  } else {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            "Tu fais ta part bravo !",
            style: ZineTextStyle.regular15green(context),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        Center(
          child: ZineButtonIcon(
            label: "Partager",
            icon: Icon(Icons.share),
            callback: () {
              Share.share('Je réalise le défi "' +
                  defi.title +
                  '". Viens me rejoindre sur Zine !');
            },
            backgroundColor: Colors.transparent,
            textColor: greenZine,
          ),
        ),
      ],
    );
  }
}
