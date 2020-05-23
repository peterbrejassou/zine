import 'package:flutter/material.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/StepDefi.dart';

class StepComponent extends StatelessWidget {
  final StepDefi step;

  StepComponent({Key key, @required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 1,
          color: greenZine,
        ),
      ),
      child: Row(
        children: <Widget>[
          Text("Étape " + step.number.toString()),
          Text(step.description),
          Icon(Icons.check_circle_outline),
        ],
      ),
    );
  }
}
