import 'package:MahaBelly/Constants/constants.dart';
import 'package:MahaBelly/view/auth/auth_page.dart';
import 'package:MahaBelly/view/home.dart';
import 'package:MahaBelly/view/recipeList/recipe_listpage.dart';
import 'package:MahaBelly/view/welcome.dart';
import 'package:MahaBelly/wrapper.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    MaterialPageRoute materialPageRoute;
    switch (settings.name) {
      case Constants.welcomeRoute:
        materialPageRoute = MaterialPageRoute(builder: (_) => WelcomePage());
        break;
      case Constants.authRoute:
        materialPageRoute = MaterialPageRoute(builder: (_) => AuthPage());
        break;
      case Constants.homeRoute:
        materialPageRoute = MaterialPageRoute(builder: (_) => HomePage());
        break;
      case Constants.recipeListPageRoute:
        materialPageRoute = MaterialPageRoute(builder: (_) => RecipeListPage());
        break;
      case Constants.wrapperPage:
        materialPageRoute = MaterialPageRoute(builder: (_) => Wrapper());
        break;
    }
    return materialPageRoute;
  }
}
