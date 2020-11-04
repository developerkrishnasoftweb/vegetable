import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black
    ),
    bodyText2: TextStyle(
        color: Colors.white54,
    ),
  ),
  fontFamily: "Poppins-Regular"
);