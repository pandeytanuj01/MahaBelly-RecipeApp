import 'package:MahaBelly/networking/recipe_repository.dart';
import 'package:MahaBelly/networking/recipe_response.dart';
import 'package:MahaBelly/networking/response.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class RecipeModel extends Model {
  RecipeRepository _recipeRepository;

  ApiResponse<List<Recipe>> _recipeList;

  ApiResponse<List<Recipe>> get recipeList => _recipeList;

  Color _color = Colors.green;

  Color get color => _color;

  RecipeModel() {
    _recipeList = ApiResponse<List<Recipe>>();
    print('---------------------API RESPONSE----------------------');
    _recipeRepository = RecipeRepository();
    print('-----------------------Repository-----------------------');
    fetchRecipeList();
  }

  changeColorNotifier(Color color) {
    _color = color;
    notifyListeners();
  }

  fetchRecipeList() async {
    _recipeList = ApiResponse.loading('Fetching Recipes');
    notifyListeners();
    try {
      List<Recipe> recipes = await _recipeRepository.fetchRecipeList('apple');
      _recipeList = ApiResponse.completed(recipes);
      notifyListeners();
    } catch (e) {
      _recipeList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
