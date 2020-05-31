import 'package:MahaBelly/Constants/constants.dart';
import 'package:MahaBelly/view/auth/auth.dart';
import 'package:MahaBelly/view/home.dart';
import 'package:MahaBelly/view/recipeList/recipe_listpage.dart';
import 'package:MahaBelly/view/welcome.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    MaterialPageRoute materialPageRoute;
    switch (settings.name) {
      case Constants.welcomeRoute:
        materialPageRoute = MaterialPageRoute(builder: (_) => WelcomePage());
        break;
      case Constants.authRoute:
        var data = settings.arguments as String;
        materialPageRoute = MaterialPageRoute(builder: (_) => AuthPage(data));
        break;
      case Constants.homeRoute:
        materialPageRoute = MaterialPageRoute(builder: (_) => HomePage());
        break;
      case Constants.recipeListPageRoute:
        materialPageRoute = MaterialPageRoute(builder: (_) => RecipeListPage());
    }
    return materialPageRoute;
  }
}
