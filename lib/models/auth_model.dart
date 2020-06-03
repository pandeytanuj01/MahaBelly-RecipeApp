import 'package:MahaBelly/models/home_model.dart';
import 'package:MahaBelly/models/user_model.dart';
import 'package:MahaBelly/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  String _signType;
  GlobalKey<FormState> _formKey;
  Map<String, String> _formData;
  String _errorMessage;
  // bool _obscureText;
  UserModel _userModel = locator<UserModel>();
  HomeModel _homeModel = locator<HomeModel>();

  get formData => _formData;
  get signType => _signType;
  get formKey => _formKey;
  get errorMessage => _errorMessage;
  // get obscureText => _obscureText;

  setSignType(String signType) {
    if (_signType == signType) return;
    _signType = signType;
    notifyListeners();
  }

  setErrorMessage(String text) {
    _errorMessage = text;
    notifyListeners();
  }

  // setObscureText(bool obscureText) {
  //   _obscureText = obscureText;
  //   notifyListeners();
  // }
  setFormKey(GlobalKey<FormState> formKey) {
    _formKey = formKey;
  }

  setFormData(Map<String, String> formData) {
    _formData = formData;
  }

  toggleAuthForm(String text) {
    _formKey.currentState?.reset();
    setSignType(text);
  }

  nameOnSaved(String val) {
    _formData['name'] = val;
  }

  emailOnSaved(String val) {
    _formData['email'] = val;
  }

  passwordOnSaved(String val) {
    _formData['password'] = val;
  }

  emailValidator(String val) {
    String errorText;
    if (val.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(val)) {
      errorText = 'Please enter a valid email';
    }
    return errorText;
  }

  passwordValidator(String val) {
    if (val.isEmpty || val.length < 8) {
      return 'Password should be greater than 8 chars.';
    }
  }

  nameValidator(String val) {
    if (val.isEmpty || val.length < 4) {
      return 'Name should be more than 4 chars.';
    }
  }

  // toggleObscureText(obscureText) {
  //   setObscureText(!obscureText);
  // }

  submitForm(BuildContext context, String signType) async {
    if (!_formKey.currentState.validate()) {
      return '';
    }
    _formKey.currentState.save();
    try {
      if (signType == 'Sign Up') {
        await _userModel.createNewUser(
            _formData['name'], _formData['email'], _formData['password']);
      } else {
        await _userModel.logIn(_formData['email'], _formData['password']);
      }
      return 'Success';
    } catch (e) {
      setErrorMessage(e);
      print('------------------------AUTH MODEL-----------------------' +
          _errorMessage);
      return 'Error';
    }
  }
}
