import 'package:MahaBelly/models/recipe_model.dart';
import 'package:MahaBelly/networking/response.dart';
import 'package:MahaBelly/service_locator.dart';
import 'package:MahaBelly/shared/error.dart';
import 'package:MahaBelly/shared/loading.dart';
import 'package:MahaBelly/view/recipeList/recipe_list.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class RecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<RecipeModel>(
      model: locator<RecipeModel>(),
      child: ScopedModelDescendant<RecipeModel>(
        builder: (context, child, model) {
          switch (model.recipeList.status) {
            case Status.LOADING:
              return Loading(
                loadingMessage: model.recipeList.message,
              );
              break;
            case Status.COMPLETED:
              return RecipeList(
                  list: model.recipeList.data);
              break;
            case Status.ERROR:
              return Error(
                errorMessage: model.recipeList.message,
                onRetryPressed: model.fetchRecipeList,
              );
              break;
          }
        },
      ),
    );
  }
}
