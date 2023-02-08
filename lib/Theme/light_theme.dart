import 'package:flutter/material.dart';
import 'package:ecommerce_application/Theme/login_page.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: LoginColor.bodyColor,
  scaffoldBackgroundColor: LoginColor.bodyColor,
  hintColor: LoginColor.textcolor,
  primaryColorLight: LoginColor.buttonbangroundcolor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.black,
  ),
);
