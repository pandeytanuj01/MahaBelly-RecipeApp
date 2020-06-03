import 'package:MahaBelly/Constants/static_api.dart';

class RecipeResponse {
  List<Recipe> results;

  RecipeResponse({this.results});

  RecipeResponse.fromJson(Map<String, dynamic> json) {
    if (json[SearchStatic.keyResponse] != null) {
      results = new List<Recipe>();
      json[SearchStatic.keyResponse].forEach((v) {
        results.add(new Recipe.fromJson(v));
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
      analyzedInstructions = new List<AnalyzedInstructions>();
      json[SearchStatic.keyAnalyzedInstructions].forEach((v) {
        analyzedInstructions.add(new AnalyzedInstructions.fromJson(v));
      });
    }
  }
} //itna time vscode :/ ek min api bhi dekhlo, abhi nai

class AnalyzedInstructions {
  List<Steps> steps;

  AnalyzedInstructions({this.steps});

  AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    if (json[SearchStatic.keySteps] != null) {
      steps = new List<Steps>();
      json[SearchStatic.keySteps].forEach((v) {
        steps.add(new Steps.fromJson(v));
      });
    }
  }
}

class Steps {
  int number;
  String step;

  Steps({this.number, this.step});

  Steps.fromJson(Map<String, dynamic> json) {
    number = json[SearchStatic.keyNumber];
    step = json[SearchStatic.keyStep];
  }
}
