import 'package:chat_room/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isObscure = true;
  bool isVisible = false;
  String? email;
  String? password;
  String errorMessage = '';

  // change visibility of password
  void changeVisibility() {
    isVisible = !isVisible;
    isObscure = !isObscure;
    notifyListeners();
  }

  // set email from email field
  void setEmail(String email) {
    this.email = email;
  }

  // set password from password field
  void setPassword(String password) {
    this.password = password;
  }

  void setError(String err) {
    errorMessage = err;
    notifyListeners();
  }

  // signing up the user
  Future<void> _signUp() async {
    bool isSuccess = await AuthService.signUp(email!, password!);
    if (isSuccess) {
      return;
    }
    throw ('Failed to Sign up');
  }

  // signing in the user
  Future<void> _signIn() async {
    try {
      bool isSuccess = await AuthService.signIn(email!, password!);
      if (isSuccess) {
        return;
      }
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  // authenticating user
  Future<void> authenticate({
    required bool validate,
    bool isSignIn = true,
  }) async{
    if (validate) {
      try {
        if (isSignIn) {
         await _signIn();
        } else {
         await _signUp();
        }
      } on FirebaseAuthException catch (e) {
        setError(e.message!);
      } catch (e) {
        setError(e.toString());
      }
    }
  }

  // checking authenticated user
  bool checkUser(){
    return AuthService.user != null;
  }

  Future<void> signOut() async{
    await AuthService.signOut();
    return;
  }
}
