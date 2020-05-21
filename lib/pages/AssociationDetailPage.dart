import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Association.dart';
import 'package:zine/pages/AssociationsPage.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/theme.dart';

class AssociationDetailsPage extends StatelessWidget {
  final Association association;

  const AssociationDetailsPage({Key key, this.association}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _bodyChanger.setBody(AssociationsPage());
                  },
                  child: Container(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 30)),
                Container(
                  width: MediaQuery.of(context).size.width - 114,
                  child: Text(
                    "Don : " + association.name,
                    style: ZineTextStyle.regular20(context),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image.network(
                    association.img,
                    height: 200,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                Text(
                  association.description,
                  style: ZineTextStyle.regular15gray(context),
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                Text(
                  association.pointsDonation.toString() +
                      "€ " +
                      association.textDonation,
                  style: ZineTextStyle.bold15green(context),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      association.pointsDonation.toString(),
                      style: ZineTextStyle.bold20green(context),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Image.asset(
                      'assets/icons/drop.png',
                      width: 12,
                      color: greenZine,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                ZineButton(
                  label: "Je fais un don",
                  callback: () {},
                  borderColor: greenZine,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
