import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegetable/Pages/home.dart';
import 'package:vegetable/Pages/home1.dart';
import 'Pages/SignIn_SignUp/signin.dart';
import 'Theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}