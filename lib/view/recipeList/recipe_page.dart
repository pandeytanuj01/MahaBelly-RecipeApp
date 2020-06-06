import 'package:MahaBelly/view/recipeList/recipe_listview.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Recipes',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: Icon(
          Icons.restaurant_menu,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: RecipeListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.filter_list,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
