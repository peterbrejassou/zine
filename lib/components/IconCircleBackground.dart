import 'package:flutter/material.dart';
import 'package:zine/constants.dart';

class IconCircleBackground extends StatelessWidget {
  final String icon;
  final String image;
  final Color color;
  final double width;
  final double padding;

  const IconCircleBackground({
    this.icon,
    this.image,
    this.color = grayZine,
    this.width: 40,
    this.padding: 12,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (icon != null) {
      imageWidget = Image.asset(
        'assets/icons/' + icon,
        alignment: Alignment.center,
      );
    } else if (image != null) {
      imageWidget = Image.network(
        image,
        height: 40,
      );
    }
    return Container(
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: imageWidget,
    );
  }
}
