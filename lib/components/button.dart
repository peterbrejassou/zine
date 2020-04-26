import 'package:flutter/material.dart';
import 'package:zine/theme/constants.dart';

class CustomButton extends FlatButton {
  CustomButton({
    @required String text,
    @required VoidCallback callback,
    Color backgroundColor: greenZine,
    Color textColor: Colors.white,
  }) : super(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50),
          ),
          color: backgroundColor,
          textColor: textColor,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          onPressed: () {},
          child: Text(text.toUpperCase()),
        );
}
