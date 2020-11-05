import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vegetable/services/services.dart';
import '../../Pages/home1.dart';
import '../../Components/customButton.dart';
import '../../Components/textinput.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool terms = false;
  bool signUpStatus = false;
  String fullName, email, mobile, password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
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
              Container(
                alignment: Alignment.centerLeft,
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  "Let's get start!",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width,
                padding: const EdgeInsets.only(
                    right: 30, left: 30, top: 5, bottom: 20),
                child: Text(
                  "Create an account on to use all the features",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Color(0xffA8A8A8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
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
                      fullName = value;
                    });
                  },
                  text: "Full Name"),
              input(
                  context: context,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffA8A8A8))),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  text: "Email"),
              input(
                  context: context,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffA8A8A8))),
                  ),
                  onChanged: (value) {
                    setState(() {
                      mobile = value;
                    });
                  },
                  text: "Mobile No."),
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
                alignment: Alignment.centerLeft,
                child: CheckboxListTile(
                    value: terms,
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "By signing up, you agree to our terms & policy",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Color(0xffa8a8a8),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    onChanged: (value) {
                      setState(() {
                        terms = !terms;
                      });
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              button(
                  context: context,
                  onPressed: () async {
                    if (fullName != null &&
                        fullName != "" &&
                        email != null &&
                        email != "" &&
                        mobile != null &&
                        mobile != "" &&
                        password != null &&
                        password != "") {
                      if (terms) {
                        if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) {
                          if (RegExp(r"^(?:[+0]9)?[0-9]{10}$")
                              .hasMatch(mobile)) {
                            setState(() => signUpStatus = true);
                            String firstName, lastName;
                            if (fullName.split(" ").length >= 2) {
                              firstName = fullName.split(" ")[0];
                              lastName = fullName.split(" ")[1];
                            } else
                              firstName = fullName;
                            FormData formData = FormData.fromMap({
                              "first_name": firstName,
                              "last_name": lastName,
                              "email": email,
                              "mobile": mobile,
                              "gender": null,
                              "password": password,
                            });
                            print(formData.fields);
                            await Services.signUp(formData).then((value) {
                              if (value.response == 1) {
                                Fluttertoast.showToast(msg: value.message);
                                setState(() => signUpStatus = false);
                              } else {
                                Fluttertoast.showToast(msg: value.message);
                                setState(() => signUpStatus = false);
                              }
                            });
                          } else {
                            Fluttertoast.showToast(msg: "Invalid Mobile");
                          }
                        } else {
                          Fluttertoast.showToast(msg: "Invalid Email");
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please check terms & conditions");
                      }
                    } else {
                      Fluttertoast.showToast(msg: "All fields are required!");
                    }
                  },
                  height: 65,
                  child: signUpStatus
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : Text(
                          "Sign Up",
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
                            Navigator.pop(context);
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
