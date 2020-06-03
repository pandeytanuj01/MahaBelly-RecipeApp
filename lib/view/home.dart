import 'package:MahaBelly/models/home_model.dart';
import 'package:MahaBelly/service_locator.dart';
import 'package:MahaBelly/shared/shared_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
      model: locator<HomeModel>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: _buildBackgroundImage(),
          child: Stack(
            children: <Widget>[
              _buildText(),
              _buildClickButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickButton(BuildContext context) {
    return ScopedModelDescendant<HomeModel>(
      builder: (context, child, model) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 80.0),
            child: SharedButton(
                btnText: 'Click',
                color: Theme.of(context).primaryColor,
                fontColor: Theme.of(context).accentColor,
                onPressed: () {
                  // model.getImageFromCamera().then((value) => null);
                  Navigator.pushReplacementNamed(context, '/recipeList');
                }),
          ),
        );
      },
    );
  }

  Container _buildText() {
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 15.0, right: 10.0),
      child: Text(
        'Get \nyour desired recipes in one',
        style: GoogleFonts.ebGaramond(
            fontSize: 70.0, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }

  BoxDecoration _buildBackgroundImage() {
    return BoxDecoration(
      image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.55), BlendMode.darken),
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover),
    );
  }
}
