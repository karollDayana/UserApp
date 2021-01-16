import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
  String _username;
  String _password;

  String get username => this._username;
  String get password => this._password;

  set username(String value){
    this._username = value;
    notifyListeners();
  }

  set password(String value){
    this._password = value;
    notifyListeners();
  }
}