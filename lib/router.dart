import 'package:MahaBelly/Constants/constants.dart';
import 'package:MahaBelly/view/auth.dart';
import 'package:MahaBelly/view/home.dart';
import 'package:MahaBelly/view/welcome.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomePage());
        break;
      case Constants.authRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => AuthPage(data));
        break;
      case Constants.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
    }
  }
}
