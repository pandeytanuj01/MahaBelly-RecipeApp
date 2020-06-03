abstract class ApiStatic {
  static const baseURL = "https://api.spoonacular.com/recipes/";
  static const apiKey = "41e875bb99f94af696fcc5ce5e131ccc";
}

abstract class SearchStatic {
  static const searchURL = 'complexSearch?' +
      "apiKey=" +
      ApiStatic.apiKey +
      "&addRecipeInformation=true&instructionsRequired=true&includeIngredients=";
  static const keyResponse = "results";
  static const keyID = "id";
  static const keyTitle = "title";
  static const keyImageURI = "image";
  static const keyReadyMin = "readyInMinutes";
  static const keyOffset = "offset";
  static const keyCuisine = "cuisine";
  static const keyMealType = "dishTypes";
  static const keyDiets = "diets";
  static const keySummary = "summary";
  static const keyArticleURL = "sourceURL";
  static const keySteps = "steps";
  static const keyStep = "step";
  static const keyNumber = "number";
  static const keyAnalyzedInstructions = "analyzedInstructions";
}
