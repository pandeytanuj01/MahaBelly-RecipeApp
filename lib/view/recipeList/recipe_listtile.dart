import 'package:flutter/material.dart';

class RecipeListTile extends StatelessWidget {
  final String title;
  final String imageURI;

  RecipeListTile({@required this.title, @required this.imageURI});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(top: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: ListTile(
            onTap: () {
              
            },
            title: Text(title),
            leading: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(imageURI),
            ),
          ),
        ),
      ),
    );
  }
}
