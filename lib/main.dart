import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/Pages/home.dart';
import 'Pages/SignIn_SignUp/signin.dart';
import 'Theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  getCredential().then((status) {
    runApp(MaterialApp(
      theme: themeData,
      home:  status ? Home() : SignIn(),
      debugShowCheckedModeBanner: false,
    ));
  });
}

Future<bool> getCredential() async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  if (sharedPreference.getString("email") != null && sharedPreference.getString("password") != null)
    return true;
  else
    return false;
}

