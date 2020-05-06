import 'package:flutter/material.dart';
import 'package:zine/theme/constants.dart';

class CustomButton extends FlatButton {
  CustomButton(
      {@required String text,
      @required VoidCallback callback,
      Color backgroundColor: greenZine,
      Color textColor: Colors.white,
      Color borderColor: greenZine,
      Image logo})
      : super(
          shape: StadiumBorder(
            side: BorderSide(color: borderColor, width: 1),
          ),
          color: backgroundColor,
          textColor: textColor,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          onPressed: callback,
          child: Text(text.toUpperCase()),
        );
}

class CustomButtonIcon extends StatelessWidget {
  final String label;
  final Icon icon;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color textColor;

  const CustomButtonIcon({
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
      label: Text(label),
      color: backgroundColor,
      textColor: textColor,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      shape: StadiumBorder(
        side: BorderSide(color: textColor, width: 1),
      ),
    );
  }
}
