import 'package:MahaBelly/models/auth_model.dart';
import 'package:MahaBelly/service_locator.dart';
import 'package:MahaBelly/shared/shared_btn.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
      model: locator<AuthModel>(),
      child: Scaffold(
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
              child: ScopedModelDescendant<AuthModel>(
                builder: (context, child, model) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Welcome!',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SharedButton(
                        btnText: 'Sign In',
                        color: Theme.of(context).primaryColor,
                        fontColor: Theme.of(context).accentColor,
                        onPressed: () {
                          model.setSignType('Sign In');
                          Navigator.pushReplacementNamed(context, '/auth');
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SharedButton(
                        btnText: 'Sign Up',
                        color: Theme.of(context).accentColor,
                        fontColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          model.setSignType('Sign Up');
                          Navigator.pushReplacementNamed(context, '/auth');
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
