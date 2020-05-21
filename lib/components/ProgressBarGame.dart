import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:zine/constants.dart';
import 'package:zine/theme.dart';

class ProgressBarGame extends StatelessWidget {
  final String title;
  final Color color;
  final double percent;
  const ProgressBarGame(
      {Key key, this.title, this.color: greenZine, this.percent: 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            title,
            style: ZineTextStyle.bold15(context),
          ),
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 110,
          animation: true,
          animationDuration: 500,
          lineHeight: 30,
          trailing: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              (percent * 100).toInt().toString() + '%',
              style: ZineTextStyle.regular15(context),
            ),
          ),
          percent: percent,
          progressColor: color,
        ),
      ],
    );
  }
}
