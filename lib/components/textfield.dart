import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String field;
  final TextInputType type;
  final bool obscure;

  CustomTextField({
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
