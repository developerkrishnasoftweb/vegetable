import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vegetable/Components/userdata.dart';
import 'package:vegetable/services/services.dart';
import '../../Components/customButton.dart';
import '../../Components/textinput.dart';
import '../home.dart';
import 'signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  final String email;
  SignIn({this.email});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textEditingController = TextEditingController();
  bool loginStatus = false;
  String email, password;

  @override
  void initState() {
    textEditingController.text = email = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
                width: 209,
                height: 70,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Welcome Back!",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Color(0xff81AE4F),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 20),
                child: Text(
                  "Login to your existing account",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Color(0xffA8A8A8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              input(
                controller: textEditingController,
                context: context,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xffA8A8A8))),
                ),
                text: "Email & Mobile No.",
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              input(
                  context: context,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffA8A8A8))),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                  text: "Password"),
              Container(
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Color(0xff000000), fontSize: 14),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              button(
                  context: context,
                  onPressed: () async {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSecond()));
                    setState(() {
                      loginStatus = true;
                    });
                    if (email != null &&
                        email != "" &&
                        password != null &&
                        password != "") {
                      FormData formData = FormData.fromMap(
                          {"email": email, "password": password});
                      await Services.signIn(formData).then((value) async {
                        if (value.response == 1) {
                          SharedPreferences sharedPreference = await SharedPreferences.getInstance();
                          sharedPreference.setString("email", email);
                          sharedPreference.setString("password", password);
                          sharedPreference.setString("id", value.data[0]["id"]);
                          sharedPreference.setString("userData", jsonEncode(value.data).toString());
                          setState(() {
                            loginStatus = false;
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                              (route) => false);
                        } else {
                          setState(() => loginStatus = false);
                          Fluttertoast.showToast(msg: value.message);
                        }
                      });
                    } else {
                      setState(() => loginStatus = false);
                      Fluttertoast.showToast(
                          msg: "Please enter username & password");
                    }
                  },
                  height: 65,
                  child: loginStatus
                      ? SizedBox(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                          height: 30,
                          width: 30,
                        )
                      : Text(
                          "Sign In",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Color(0xffffffff),
                                fontSize: 18,
                              ),
                        )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: RichText(
                  text: TextSpan(
                      text: "Don't have an account?\t",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Color(0xffa8a8a8),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      children: [
                        WidgetSpan(
                            child: GestureDetector(
                          child: Text(
                            "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Color(0xff81AE4F),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                        ))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
