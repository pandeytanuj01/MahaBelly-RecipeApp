import 'package:MahaBelly/shared/shared_btn.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 140.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/icon.png'),
            ),
          ),
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
                SharedButton(
                  btnText: 'Sign In',
                  color: Theme.of(context).primaryColor,
                  fontColor: Theme.of(context).accentColor,
                  onPressed: () => Navigator.pushNamed(context, '/auth',
                      arguments: 'Sign In'),
                ),
                SizedBox(
                  height: 20,
                ),
                SharedButton(
                  btnText: 'Sign Up',
                  color: Theme.of(context).accentColor,
                  fontColor: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.pushNamed(context, '/auth',
                      arguments: 'Sign Up'),
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
