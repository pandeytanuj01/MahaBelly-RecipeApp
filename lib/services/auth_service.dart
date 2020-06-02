import 'package:MahaBelly/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  // Future<void> sendEmailVerification();

  Future<void> signOut();

  // Future<bool> isEmailVerified();
}

class AuthService implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebaseUSer);
  }

  User _userFromFirebaseUSer(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future<String> signIn(String email, String password) async {
    String errorMessage;
    FirebaseUser user;
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
    } catch (e) {
      print(
          '----------------------------------SERVICE ERROR-------------------------------' +
              e.message);
      errorMessage = e.message;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    String errorMessage;
    FirebaseUser user;
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
    } catch (e) {
      print(
          '----------------------------------SERVICE ERROR-------------------------------' +
              e.message);
      errorMessage = e.message;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  // Future<void> sendEmailVerification() async {
  //   FirebaseUser user = await _firebaseAuth.currentUser();
  //   user.sendEmailVerification();
  // }

  // Future<bool> isEmailVerified() async {
  //   FirebaseUser user = await _firebaseAuth.currentUser();
  //   return user.isEmailVerified;
  // }
}
