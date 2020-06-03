import 'package:flutter/material.dart';
import 'package:zine/constants.dart';
import 'package:zine/theme.dart';
import 'dart:math' as math;

class StatCard extends StatelessWidget {
  final String number;
  final String text;

  const StatCard({
    Key key,
    this.number,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 70,
              child: Text(
                number,
                style: ZineTextStyle.bold20green(context),
              ),
            ),
            Text(
              text,
              style: ZineTextStyle.regular15(context),
            ),
          ],
        ),
        Transform.rotate(
          angle: 270 * math.pi / 180,
          child: Icon(Icons.arrow_back_ios, size: 20, color: grayZine),
        ),
      ],
    );
  }
}
