import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Category.dart';
import 'package:zine/models/Defi.dart';
import 'package:zine/pages/DefiDetail.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/services/ThemeChanger.dart';
import 'package:zine/theme.dart';

class CardDefi extends StatelessWidget {
  final Defi defi;
  final Category category;

  const CardDefi({
    Key key,
    this.defi,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);
    final theme = Provider.of<ThemeChanger>(context);
    final brightness = theme.getThemeBrightness();

    int totalPointsDefi = 0;
    defi.steps.forEach((step) {
      totalPointsDefi += step.points;
    });

    return GestureDetector(
      onTap: () {
        _bodyChanger.setBody(
            DefiDetails(defi: defi, newDefi: true, category: category));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: (brightness == Brightness.dark)
                  ? Colors.transparent
                  : Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
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
                    style: ZineTextStyle.regular15(context),
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
                          defi.users.length.toString(),
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
                        Padding(padding: EdgeInsets.only(top: 6)),
                        Text(
                          totalPointsDefi.toString(),
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
