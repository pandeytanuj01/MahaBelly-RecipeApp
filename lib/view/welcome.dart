import 'package:MahaBelly/shared/signin_btn.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 35,
                ),
                WelcomeButton(
                  btnText: 'Sign In',
                  color: Theme.of(context).primaryColor,
                  fontColor: Theme.of(context).accentColor,
                ),
                SizedBox(
                  height: 20,
                ),
                WelcomeButton(
                  btnText: 'Sign Up',
                  color: Theme.of(context).accentColor,
                  fontColor: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
