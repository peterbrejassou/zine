import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/DayOfWeek.dart';
import 'package:zine/constants.dart';
import 'package:zine/services/ThemeChanger.dart';
import 'package:zine/theme.dart';
import 'dart:math' as math;

class Reminder extends StatefulWidget {
  const Reminder({Key key}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  bool _open = false;
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay timePicked;

  Future<Null> selectTime(BuildContext context) async {
    timePicked = await showTimePicker(context: context, initialTime: _time);
    if (timePicked != null) {
      setState(() {
        _time = timePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final brightness = theme.getThemeBrightness();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: brightness == Brightness.dark ? Colors.white : grayZine),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _open = !_open;
              });
            },
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
                    if (_open)
                      Text(
                        "Définir un rappel",
                        style: ZineTextStyle.regular15(context),
                      ),
                    if (!_open)
                      Text(
                        "Aucun rappel défini",
                        style: ZineTextStyle.regular15(context),
                      ),
                  ],
                ),
                Transform.rotate(
                  angle: _open ? (270 * math.pi / 180) : (180 * math.pi / 180),
                  child: Icon(Icons.arrow_back_ios, size: 20, color: grayZine),
                ),
              ],
            ),
          ),
          if (_open) Padding(padding: EdgeInsets.only(top: 30)),
          if (_open)
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    selectTime(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Heure",
                        style: ZineTextStyle.regular15(context),
                      ),
                      Text(
                        _time.format(context),
                        style: ZineTextStyle.regular25green(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          if (_open) Padding(padding: EdgeInsets.only(top: 20)),
          if (_open)
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Répétitions",
                      style: ZineTextStyle.regular15(context),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      width: MediaQuery.of(context).size.width - 92,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DayOfWeek(day: 'L'),
                          DayOfWeek(day: "M"),
                          DayOfWeek(day: "M"),
                          DayOfWeek(day: "J"),
                          DayOfWeek(day: "V"),
                          DayOfWeek(day: "S"),
                          DayOfWeek(day: "D"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
