import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String btnText;
  final Color color;
  final Color fontColor;

  WelcomeButton({
    @required this.btnText,
    this.color,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 13,
      width: MediaQuery.of(context).size.width / 1.5,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
        ),
        child: Text(
          btnText,
          style: TextStyle(color: fontColor, fontSize: 18.0),
        ),
        color: color,
        onPressed: () => Navigator.pushNamed(context, '/auth',arguments: btnText),
      ),
    );
  }
}
