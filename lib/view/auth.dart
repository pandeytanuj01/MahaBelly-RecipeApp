import 'package:MahaBelly/shared/screen_size_reducers.dart';
import 'package:MahaBelly/shared/text_field.dart';
import 'package:MahaBelly/shared/welcome_text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final String signType;
  AuthPage(this.signType);
  @override
  Widget build(BuildContext context) {
    bool isSignIn = signType == 'Sign In';
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: _buildBody(context));
  }

  Align _buildArrowButton(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.all(16),
          decoration:
              BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          child: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ));
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: screenHeight(context, dividedBy: 1.5),
          decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.black26,
                  offset: new Offset(0.0, 2.0),
                  blurRadius: 25.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32))),
          alignment: Alignment.topCenter,
          child: _buildForm(context),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WelcomeText(
            text: 'Welcome to MahaBelly.',
            fontSize: 25,
            isBold: true,
          ),
          WelcomeText(
            text: 'Lets get started',
            fontSize: 17,
          ),
          AuthTextField(
            text: 'Name',
            textInputType: TextInputType.text,
          ),
          AuthTextField(
            text: 'E-mail',
            textInputType: TextInputType.emailAddress,
          ),
          AuthTextField(
            text: 'Password',
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          _buildArrowButton(context),
        ],
      ),
    );
  }
}
