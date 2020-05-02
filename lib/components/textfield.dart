import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String field;
  final TextInputType type;
  final bool obscure;

  CustomTextField({
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
        Text(field),
        Padding(padding: EdgeInsets.only(top: 8)),
        TextField(
          controller: controller,
          keyboardType: type,
          obscureText: obscure,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}
