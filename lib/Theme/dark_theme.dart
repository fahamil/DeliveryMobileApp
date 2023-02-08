import 'package:flutter/material.dart';
import 'package:ecommerce_application/Theme/login_page.dart';
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: LoginColor.bodycolorDark,
  scaffoldBackgroundColor: LoginColor.bodycolorDark,
  hintColor: LoginColor.textcolor,
  primaryColorLight: LoginColor.buttonbangroundcolorDark,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.white,
  ),
);
