import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      letterSpacing: 0.3
    ),
    bodyText2: TextStyle(
        color: Colors.white54,
        letterSpacing: 0.3
    ),
  ),
  fontFamily: "Poppins-Regular"
);