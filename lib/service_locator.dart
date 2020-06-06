import 'package:MahaBelly/models/auth_model.dart';
import 'package:MahaBelly/models/recipe_model.dart';
import 'package:MahaBelly/networking/recipe_response.dart';
import 'package:MahaBelly/networking/response.dart';
import 'package:MahaBelly/services/api_service.dart';
import 'package:MahaBelly/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'models/home_model.dart';
import 'models/user_model.dart';
import 'networking/recipe_repository.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  //Register Services
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserModel());
  locator.registerLazySingleton(() => AuthModel());
  locator.registerLazySingleton(() => HomeModel());
  locator.registerLazySingleton(() => ApiBaseHelper());
  locator.registerLazySingleton(() => ApiResponse);
  locator.registerLazySingleton(() => RecipeModel());
  locator.registerLazySingleton(() => RecipeRepository());
  locator.registerLazySingleton(() => RecipeResponse());
}
