import 'package:MahaBelly/Constants/static_api.dart';

class RecipeResponse {
  List<Recipe> results;

  RecipeResponse({this.results});

  RecipeResponse.fromJson(Map<String, dynamic> json) {
    if (json[SearchStatic.keyResponse] != null) {
      results = List<Recipe>();
      json[SearchStatic.keyResponse].forEach((v) {
        results.add(Recipe.fromJson(v));
      });
    }
  }
}

class Recipe {
  int id;
  String title;
  String imageURI;
  int readyMinutes;
  String articleURL;
  List<String> mealTypes;
  List<String> cuisines;
  List<String> diets;
  String summary;
  List<AnalyzedInstructions> analyzedInstructions;

  Recipe(
      {this.articleURL,
      this.mealTypes,
      this.cuisines,
      this.diets,
      this.summary,
      this.id,
      this.title,
      this.imageURI,
      this.readyMinutes,
      this.analyzedInstructions});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json[SearchStatic.keyID];
    title = json[SearchStatic.keyTitle];
    imageURI = json[SearchStatic.keyImageURI];
    readyMinutes = json[SearchStatic.keyReadyMin];
    articleURL = json[SearchStatic.keyArticleURL];
    mealTypes = json[SearchStatic.keyMealType].cast<String>();
    cuisines = json[SearchStatic.keyCuisine];
    diets = json[SearchStatic.keyDiets].cast<String>();
    summary = json[SearchStatic.keySummary];
    if (json[SearchStatic.keyAnalyzedInstructions] != null) {
      analyzedInstructions = List<AnalyzedInstructions>();
      json[SearchStatic.keyAnalyzedInstructions].forEach((v) {
        analyzedInstructions.add(AnalyzedInstructions.fromJson(v));
        print('------------------Instructions-----------------' + analyzedInstructions.toString());
      });
    }
  }
}

class AnalyzedInstructions {
  List<Steps> _steps;

  List<Steps> get steps => _steps;

  AnalyzedInstructions(this._steps);

  AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    if (json[SearchStatic.keySteps] != null) {
      _steps = List<Steps>();
      json[SearchStatic.keySteps].forEach((v) {
        _steps.add(Steps.fromJson(v));
        print('--------------------------Steps--------------------------' + _steps.toString());
      });
    }
  }
}

class Steps {
  int _number;
  String _step;

  int get number => _number;
  String get step => _step;
  Steps(this._number, this._step);

  Steps.fromJson(Map<String, dynamic> json) {
    _number = json[SearchStatic.keyNumber];
    _step = json[SearchStatic.keyStep];
    print('----------------------------------Step------------------------------' + _step);
  }
}
