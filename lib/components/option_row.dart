import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/theme/theme.dart';

class OptionRow extends StatelessWidget {
  final String icon, text;
  final VoidCallback callback;

  const OptionRow({
    @required this.icon,
    @required this.text,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Row(
        children: <Widget>[
          IconCircleBackground(icon: icon),
          Padding(padding: EdgeInsets.only(left: 15)),
          Text(text, style: CustomTextStyle.regular20(context)),
        ],
      ),
    );
  }
}
