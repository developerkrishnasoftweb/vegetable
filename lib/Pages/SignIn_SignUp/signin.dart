import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Hello world", style: TextStyle(color: Colors.black),)),
    );
  }
}
