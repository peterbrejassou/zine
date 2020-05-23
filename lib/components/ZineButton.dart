import 'package:flutter/material.dart';
import 'package:zine/constants.dart';
import 'package:zine/theme.dart';

class ZineButton extends StatelessWidget {
  final String label;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const ZineButton({
    Key key,
    @required this.label,
    @required this.callback,
    this.backgroundColor: greenZine,
    this.textColor: whiteZine,
    this.borderColor: greenZine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: StadiumBorder(
        side: BorderSide(color: borderColor, width: 1),
      ),
      color: backgroundColor,
      textColor: textColor,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      onPressed: callback,
      child: Text(
        label.toUpperCase(),
        style: (backgroundColor != Colors.transparent)
            ? ZineTextStyle.buttonText(context)
            : ZineTextStyle.bold13(context),
      ),
    );
  }
}

class ZineButtonIcon extends StatelessWidget {
  final String label;
  final Icon icon;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color textColor;

  const ZineButtonIcon({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.callback,
    this.backgroundColor: greenZine,
    this.textColor: Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: callback,
      icon: icon,
      label: Text(
        label,
        style: ZineTextStyle.bold15(context),
      ),
      color: backgroundColor,
      textColor: textColor,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      shape: StadiumBorder(
        side: BorderSide(color: textColor, width: 1),
      ),
    );
  }
}
