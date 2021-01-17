import 'package:flutter/material.dart';
import 'package:userapp/src/models/usuario_model.dart';

class UsuarioProvider with ChangeNotifier{
  Usuario _usuario = Usuario(username: '', password: '');
  bool _isLogin = false;

  UsuarioProvider(

  );

  Usuario get usuario => this._usuario;
  bool get isLogin => this._isLogin;

  void cambiarNombre(String value){
    this._usuario.username = value;
    notifyListeners();
  }

  void cambiarPassword(String value){
    this._usuario.username = value;
    notifyListeners();
  }

  set isLogin(bool value){
    this._isLogin = value;
    notifyListeners();
  }


}