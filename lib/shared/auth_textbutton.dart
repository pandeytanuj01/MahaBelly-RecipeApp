import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String text;
  final EdgeInsets padding;

  AuthTextButton({@required this.text, this.padding});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: padding,
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
