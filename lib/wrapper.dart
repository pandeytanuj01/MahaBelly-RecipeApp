import 'package:MahaBelly/models/user_model.dart';
import 'package:MahaBelly/service_locator.dart';
import 'package:MahaBelly/view/home.dart';
import 'package:MahaBelly/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: locator<UserModel>(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          print(model.isLoggedIn);
          if (model.isLoggedIn == null) {
            return WelcomePage();
          } else {
            return HomePage();
          }
        },
      ),
    );
  }
}
// if (_userModel.isUserLoggedIn() == null) {
//       return WelcomePage();
//     } else {
//       return HomePage();
//     });
