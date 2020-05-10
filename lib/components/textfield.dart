import 'package:flutter/material.dart';
import 'package:zine/theme/theme.dart';

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
        Text(
          field,
          style: CustomTextStyle.regular15(context),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        TextField(
          style: CustomTextStyle.regular15(context),
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
