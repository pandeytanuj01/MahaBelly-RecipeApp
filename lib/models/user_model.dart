import 'package:MahaBelly/service_locator.dart';
import 'package:MahaBelly/services/auth_service.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  String _uid;
  String _name;
  String _email;
  String _password;

  AuthService _authService = locator<AuthService>();

  get uid => _uid;
  get name => _name;
  get email => _email;
  get password => _password;

  getUserLoginStatus(){
    return _authService.user;
  }

  createNewUser(String name, String email, String password) async {
    _name = name;
    try {
      _uid = await _authService.signUp(email, password);
    } catch (e) {
      print(
          '-------------------------------MODEL ERROR-----------------------------' +
              e);
      return Future.error(e);
    }
  }

  logIn(String email, String password) async {
    try {
      _uid = await _authService.signIn(email, password);
    } catch (e) {
      print(
          '-------------------------------MODEL ERROR-----------------------------' +
              e);
      return Future.error(e);
    }
  }

  logOut() {
    _authService.signOut();
  }

}
