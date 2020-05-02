import 'package:flutter/material.dart';
import 'package:zine/theme/constants.dart';

class IconCircleBackground extends StatelessWidget {
  final String icon;
  final Color color;
  final double width;

  const IconCircleBackground({
    @required this.icon,
    this.color = grayZine,
    this.width: 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Image.asset(
        'assets/icons/' + icon,
        width: 40,
        alignment: Alignment.center,
      ),
    );
  }
}
