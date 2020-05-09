import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/association.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class AssociationDetailsPage extends StatelessWidget {
  const AssociationDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Association association = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: ZineAppBar(),
      backgroundColor: backgroundTheme,
      body: Container(
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
                      Navigator.pop(context);
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
                      style: CustomTextStyle.regular20(context),
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
                    style: CustomTextStyle.regular15gray(context),
                  ),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Text(
                    association.pointsDonation.toString() +
                        "€ " +
                        association.textDonation,
                    style: CustomTextStyle.bold15green(context),
                    textAlign: TextAlign.center,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        association.pointsDonation.toString(),
                        style: CustomTextStyle.bold20green(context),
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
                  CustomButton(
                    text: "Je fais un don",
                    callback: () {},
                    borderColor: greenZine,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
