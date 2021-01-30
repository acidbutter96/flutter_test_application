import 'dart:ui';

import 'package:flutter/material.dart';

class ForgotButton extends StatelessWidget {
  final String text;

  ForgotButton({this.text});
  @override
  Widget build(BuildContext context) {
    return /* Padding(
      padding: EdgeInsets.only(bottom: 100),
      child:*/
        FlatButton(
      padding: EdgeInsets.only(top: 100),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      /*  ), */
    );
  }
}
