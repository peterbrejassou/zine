import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Defi.dart';
import 'package:zine/models/StepDefi.dart';
import 'package:zine/services/ThemeChanger.dart';

class StepComponent extends StatefulWidget {
  final StepDefi step;
  final Defi defi;

  StepComponent({Key key, @required this.step, @required this.defi})
      : super(key: key);

  @override
  _StepComponentState createState() => _StepComponentState();
}

class _StepComponentState extends State<StepComponent> {
  bool _achieved;
  bool _locked;

  @override
  void initState() {
    super.initState();
    _achieved = widget.step.achieved;
    _locked = widget.step.locked;
  }

  Widget buildCheck(points) {
    if (_achieved) {
      return Container(
        width: 55,
        height: 55,
        padding: new EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(55)),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          points + "\npts",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 13,
          ),
        ),
      );
    } else if (!_locked) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _achieved = !_achieved;
            //DefiService().achievedStep(widget.defi.id, widget.step.id);
          });
        },
        child: Icon(
          Icons.check_circle_outline,
          size: 55,
          color: greenZine,
        ),
      );
    } else {
      return Container();
    }
  }

  setBackgroundColor(brightness) {
    if (_achieved) {
      return greenZine;
    } else if (_locked) {
      if (brightness == Brightness.dark) {
        return Colors.white.withOpacity(0.2);
      } else {
        return Colors.black.withOpacity(0.2);
      }
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final brightness = theme.getThemeBrightness();

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: setBackgroundColor(brightness),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 1,
            color: _locked ? Colors.transparent : greenZine,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Étape " + widget.step.number.toString(),
                  style: TextStyle(
                    color: _achieved
                        ? Colors.white
                        : (brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 220,
                  child: Text(
                    widget.step.description,
                    style: TextStyle(
                      color: _achieved
                          ? Colors.white
                          : (brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                buildCheck(widget.step.points.toString()),
              ],
            ),
            if (_locked)
              Icon(
                Icons.lock,
                color:
                    brightness == Brightness.dark ? Colors.white : Colors.black,
                size: 50,
              ),
          ],
        ),
      ),
    );
  }
}
