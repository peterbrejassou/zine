import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/components/StepComponent.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/database/DefiService.dart';
import 'package:zine/theme.dart';
import 'package:share/share.dart';

class DefiDetails extends StatefulWidget {
  final Defi defi;
  final bool newDefi;

  DefiDetails({Key key, this.defi, this.newDefi}) : super(key: key);

  @override
  _DefiDetailsState createState() => _DefiDetailsState();
}

class _DefiDetailsState extends State<DefiDetails> {
  var newDefi;

  @override
  void initState() {
    super.initState();
    newDefi = widget.newDefi;
  }

  @override
  Widget build(BuildContext context) {
    int totalPointsDefi = 0;
    widget.defi.steps.forEach((step) {
      totalPointsDefi += step.points;
    });
    Widget IsNewDefi;
    if (newDefi == true) {
      IsNewDefi = Center(
        child: ZineButton(
          label: "Faire ma part",
          callback: () {
            DefiService().addUserFromDefi(widget.defi.id);
            setState(() {
              newDefi = false;
            });
          },
        ),
      );
    } else {
      IsNewDefi = Column(
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
                    widget.defi.title +
                    '". Viens me rejoindre sur Zine !');
              },
              backgroundColor: Colors.transparent,
              textColor: greenZine,
            ),
          ),
        ],
      );
    }

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
                    widget.defi.users.length.toString(),
                    style: ZineTextStyle.bold19(context),
                  ),
                  if (widget.defi.users.length == 1)
                    Text(
                      "participant",
                      style: ZineTextStyle.regular15(context),
                    ),
                  if (widget.defi.users.length != 1)
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
          IsNewDefi,
          Padding(padding: EdgeInsets.only(top: 35)),
          if (!newDefi) Reminder(),
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
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Étapes",
                  style: ZineTextStyle.bold17(context),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: widget.defi.steps.length,
                    itemBuilder: (BuildContext context, int index) {
                      StepDefi step = widget.defi.steps[index];
                      print(step);
                      return StepComponent(step: step);
                    },
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: ZineButton(
              label: "Annuler",
              callback: () {
                DefiService().removeUserFromDefi(widget.defi.id);
                setState(() {
                  newDefi = true;
                });
              },
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
