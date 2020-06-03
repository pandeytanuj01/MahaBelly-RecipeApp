import 'package:MahaBelly/view/recipeList/recipe_listview.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Recipes'),
        leading: Icon(Icons.restaurant_menu),
      ),
      body: RecipeListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.filter_list,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
