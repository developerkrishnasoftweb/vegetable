import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/home.dart';
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
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}