import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier{
  String? message;

  void setMessage(String message){
    this.message = message;
    print(this.message);
  }
}