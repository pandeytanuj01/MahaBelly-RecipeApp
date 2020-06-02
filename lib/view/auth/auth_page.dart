import 'package:MahaBelly/models/auth_model.dart';
import 'package:MahaBelly/shared/auth_textbutton.dart';
import 'package:MahaBelly/shared/screen_size_reducers.dart';
import 'package:MahaBelly/shared/text_field.dart';
import 'package:MahaBelly/shared/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../service_locator.dart';

class AuthPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'name': null,
    'email': null,
    'password': null,
  };
  // final bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    // print('------------------Auth Build Called----------------------');
    return ScopedModel<AuthModel>(
      model: locator<AuthModel>(),
      child: ScopedModelDescendant<AuthModel>(
        builder: (context, child, model) {
          // model.setObscureText(obscureText);
          model.setFormKey(_formKey);
          // print(model.signType);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: AuthTextButton(
                textColor:
                    model.signType == 'Sign In' ? Colors.green : Colors.black,
                text: 'Sign In',
                padding: EdgeInsets.only(top: 4.0),
                onPressed: () {
                  model.toggleAuthForm('Sign In');
                },
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              actions: <Widget>[
                AuthTextButton(
                  textColor:
                      model.signType == 'Sign Up' ? Colors.green : Colors.black,
                  text: 'Sign Up',
                  padding: EdgeInsets.only(right: 24.0),
                  onPressed: () {
                    model.toggleAuthForm('Sign Up');
                  },
                ),
              ],
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  height: screenHeight(context, dividedBy: 1.35),
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
                  child: Form(
                    key: _formKey,
                    child: _buildAuthForm(context, model),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  showSnackBar(BuildContext context, String errorMessage) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }

  Widget _buildArrowButton(BuildContext context) {
    return ScopedModelDescendant<AuthModel>(
      builder: (context, child, model) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.all(16),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
              color: Colors.white,
              onPressed: () async {
                String formSubmitStatus;
                model.setFormKey(_formKey);
                model.setFormData(_formData);
                formSubmitStatus =
                    await model.submitForm(context, model.signType);
                if (formSubmitStatus == 'Error')
                  showSnackBar(context, model.errorMessage);
                else if (formSubmitStatus == 'Success')
                  Navigator.pushReplacementNamed(context, '/home');
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAuthForm(BuildContext context, AuthModel model) {
    return model.signType == 'Sign In'
        ? _buildSignInForm(context)
        : _buildSignUpForm(context);
  }

  Widget _buildSignInForm(BuildContext context) {
    return ScopedModelDescendant<AuthModel>(
      builder: (context, child, model) {
        // print(obscureText);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WelcomeText(
              text: 'Log In to MahaBelly.',
              fontSize: 25.0,
              isBold: true,
            ),
            SizedBox(
              height: 10.0,
            ),
            AuthTextField(
              text: 'E-mail',
              textInputType: TextInputType.emailAddress,
              validator: model.emailValidator,
              onSaved: model.emailOnSaved,
            ),
            AuthTextField(
              text: 'Password',
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              validator: model.passwordValidator,
              onSaved: model.passwordOnSaved,
              // showPassword: () => model.toggleObscureText(obscureText),
            ),
            SizedBox(
              height: 110,
            ),
            _buildArrowButton(context),
          ],
        );
      },
    );
  }

  Widget _buildSignUpForm(BuildContext context) {
    return ScopedModelDescendant<AuthModel>(
      builder: (context, child, model) {
        // print(obscureText);
        return Column(
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
              validator: model.nameValidator,
              onSaved: model.nameOnSaved,
            ),
            AuthTextField(
              text: 'E-mail',
              textInputType: TextInputType.emailAddress,
              validator: model.emailValidator,
              onSaved: model.emailOnSaved,
            ),
            AuthTextField(
              text: 'Password',
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              validator: model.passwordValidator,
              onSaved: model.passwordOnSaved,
              // showPassword: () => model.toggleObscureText(obscureText),
            ),
            SizedBox(
              height: 20,
            ),
            _buildArrowButton(context),
          ],
        );
      },
    );
  }
}
