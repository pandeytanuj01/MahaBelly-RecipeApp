import 'package:MahaBelly/networking/recipe_response.dart';
import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  final Recipe recipe;
  final double padding;

  RecipeTitle(this.recipe, this.padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        // Default value for crossAxisAlignment is CrossAxisAlignment.center.
        // We want to align title and description of recipes left:
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            recipe.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          // Empty space:
          SizedBox(height: 15.0),
          Row(
            children: [
              Icon(Icons.timer, size: 20.0),
              SizedBox(width: 5.0),
              Text(
                '${recipe.readyMinutes.toString()} min',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
