import 'package:MahaBelly/models/user_model.dart';
import 'package:MahaBelly/service_locator.dart';
import 'package:MahaBelly/view/auth/auth_page.dart';
import 'package:MahaBelly/view/home.dart';
import 'package:MahaBelly/view/welcome.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel _userModel = locator<UserModel>();
    final user = _userModel.getUserLoginStatus();

    if (user == null) {
      return WelcomePage();
    } else {
      return HomePage();
    }
  }
}
