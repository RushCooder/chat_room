import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isVisible = false;
  String? email;
  String? password;

  void changeVisibility(){
    isVisible = !isVisible;
    isObscure = !isObscure;
    notifyListeners();
  }

  void setEmail(String email){
    this.email = email;
  }

  void setPassword(String password){
    this.password = password;
  }

  void authenticate(){
    print('email: $email');
    print('password: $password');
    print('authenticate');
  }

}