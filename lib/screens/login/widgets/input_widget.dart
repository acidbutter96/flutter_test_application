import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;

  InputField({this.hint, this.obscure, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: .5),
        ),
      ),
      child: TextFormField(
        obscureText: obscure,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            suffixIcon: Icon(
              icon,
              color: Colors.white,
              textDirection: TextDirection.rtl,
            ),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white, fontSize: 15),
            contentPadding: EdgeInsets.only(top: 30)),
      ),
    );
  }
}
