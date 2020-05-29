import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String text;
  final TextInputType textInputType;
  bool obscureText;

  AuthTextField(
      {@required this.text,
      @required this.textInputType,
      this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 24),
      child: TextField(
        style: TextStyle(fontSize: 18),
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
