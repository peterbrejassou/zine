import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Defi.dart';
import 'package:zine/pages/DefiDetail.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/theme.dart';

class CardDefi extends StatelessWidget {
  final Defi defi;

  const CardDefi({
    Key key,
    this.defi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);
    return GestureDetector(
      onTap: () {
        _bodyChanger.setBody(DefiDetails(defi: defi, newDefi: true));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 116,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: greenZine,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    defi.title,
                    textAlign: TextAlign.center,
                    style: ZineTextStyle.regular15black(context),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/hummingbird.png',
                          height: 19,
                          color: Colors.black,
                        ),
                        Text(
                          "450",
                          style: ZineTextStyle.regular15black(context),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/drop.png',
                          height: 13,
                          color: Colors.black,
                        ),
                        Text(
                          "300",
                          style: ZineTextStyle.regular15black(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
