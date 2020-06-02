import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final Function onPressed;
  final Color textColor;

  AuthTextButton(
      {@required this.text, this.padding, this.onPressed, this.textColor});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: padding,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0, color: textColor),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
