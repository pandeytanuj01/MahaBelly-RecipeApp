import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isBold;
  WelcomeText(
      {@required this.text, @required this.fontSize, this.isBold = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 8),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : null),
      ),
    );
  }
}
