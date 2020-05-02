import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Récupération des arguments passé en paramètres de la route
    Map arguments = ModalRoute.of(context).settings.arguments;

    return Container(
      color: Colors.blue,
      height: 200,
      width: 200,
      child: Center(
        child: Text(arguments['category']),
      ),
    );
  }
}
