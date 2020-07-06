import 'package:MahaBelly/Constants/static_api.dart';
import 'package:MahaBelly/networking/recipe_response.dart';
import 'package:MahaBelly/service_locator.dart';
import 'package:MahaBelly/services/api_service.dart';

class RecipeRepository {
  final _helper = locator<ApiBaseHelper>();

  Future<List<Recipe>> fetchRecipeList(String ingredients) async {
    final Map<String, dynamic> response =
        await _helper.get(SearchStatic.searchURL + ingredients);
    print(
        '----------------------------fetchFunction-----------------------------------' +
            response.toString());
    return RecipeResponse.fromJson(response).results;
  }
}
