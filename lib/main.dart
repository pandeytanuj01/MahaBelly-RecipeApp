import 'package:MahaBelly/Constants/constants.dart';
import 'package:MahaBelly/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.white,
        ),
        title: "Welcome to Maha Belly",
        initialRoute: Constants.welcomeRoute,
        onGenerateRoute: (RouteSettings settings) =>
            Router.generateRoute(settings));
  }
}
