import 'package:flutter/material.dart';
import 'package:zine/constants.dart';

class DayOfWeek extends StatefulWidget {
  final String day;
  DayOfWeek({Key key, this.day}) : super(key: key);

  @override
  _DayOfWeekState createState() => _DayOfWeekState();
}

class _DayOfWeekState extends State<DayOfWeek> {
  bool activate;

  @override
  void initState() {
    super.initState();
    activate = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activate = !activate;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: activate ? greenZine : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(35)),
          border: Border.all(
            width: 1,
            color: greenZine,
          ),
        ),
        child: Center(
            child: Text(
          widget.day,
          style: TextStyle(color: activate ? Colors.white : greenZine),
        )),
      ),
    );
  }
}
