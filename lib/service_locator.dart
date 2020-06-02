import 'package:MahaBelly/models/auth_model.dart';
import 'package:MahaBelly/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'models/home_model.dart';
import 'models/user_model.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  //Register Services
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserModel());
  locator.registerLazySingleton(() => AuthModel());
  locator.registerLazySingleton(() => HomeModel());
}
