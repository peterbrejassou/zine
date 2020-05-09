import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final Widget child;

  const CustomWidget({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Container(
        child: child,
      ),
    );
  }
}
