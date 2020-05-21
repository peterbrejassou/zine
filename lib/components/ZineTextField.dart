import 'package:flutter/material.dart';
import 'package:zine/theme.dart';

class ZineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String field;
  final TextInputType type;
  final bool obscure;

  ZineTextField({
    @required this.controller,
    @required this.field,
    this.type: TextInputType.text,
    this.obscure: false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          field,
          style: ZineTextStyle.regular15(context),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        TextField(
          style: ZineTextStyle.regular15(context),
          controller: controller,
          keyboardType: type,
          obscureText: obscure,
          decoration: InputDecoration(
            isDense: false,
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}
