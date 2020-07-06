import 'package:MahaBelly/networking/recipe_response.dart';
import 'package:MahaBelly/shared/recipe_image.dart';
import 'package:MahaBelly/shared/recipe_text.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String imageURI;
  final Recipe recipe;

  RecipeCard({@required this.title, @required this.imageURI, this.recipe});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/recipeDetails', arguments: recipe),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          borderOnForeground: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'Recipe$title',
                child: RecipeImage(imageURI),
              ),
              RecipeTitle(recipe, 15),
            ],
          ),
        ),
      ),
    );
  }
}
