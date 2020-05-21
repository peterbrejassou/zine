import 'package:flutter/material.dart';

class ZineLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
