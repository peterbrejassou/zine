import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Page boutique en développement...\nDisponible dans une prochaine mise à jour.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
