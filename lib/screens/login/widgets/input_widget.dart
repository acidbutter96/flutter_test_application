import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled;

  InputField(
      {this.hint,
      this.obscure,
      this.icon,
      this.controller,
      this.textInputType,
      this.onChanged,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: .5),
        ),
      ),
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: obscure,
        onChanged: onChanged,
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
