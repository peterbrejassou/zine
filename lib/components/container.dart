import 'package:flutter/material.dart';

class ZineContainer extends StatelessWidget {
  final Widget child;

  const ZineContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        child: child,
      ),
    );
  }
}
