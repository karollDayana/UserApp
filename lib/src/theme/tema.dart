import 'package:flutter/material.dart';

ThemeData temaGlobal(BuildContext context) {
  final tema = ThemeData(
      primaryColor: Color.fromRGBO(254, 221, 124, 1),
      textTheme: TextTheme(
          subtitle1: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Color.fromRGBO(52, 76, 105, 1),
      )));

  return tema;
}
