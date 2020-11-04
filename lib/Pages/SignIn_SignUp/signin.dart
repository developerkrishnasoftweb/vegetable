import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegetable/Components/customButton.dart';
import 'package:vegetable/Components/textinput.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Column(
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
                  child: Text("Welcome Back!",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color(0xff81AE4F), fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("Login to your existing account",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color(0xffA8A8A8), fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                input(
                    context: context,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffA8A8A8))
                      ),
                    ),
                    onTap: (){},
                    obscureText: true,
                    text: "Email & Mobile No."
                ),
                input(
                    context: context,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffA8A8A8))
                      ),
                    ),
                    onTap: (){},
                    obscureText: true,
                    text: "Password"
                ),
                SizedBox(height: 30,),
                button(context: context, onPressed: (){}, text: "SIGN IN", height: 65)
              ],
            ),
            Align(
              alignment: Alignment(0.0, .9),
              child: RichText(
                text: TextSpan(text: "Don't have an account?\t",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color(0xffa8a8a8), fontSize: 16, fontWeight: FontWeight.bold),
                    children: [
                      WidgetSpan(
                          child: GestureDetector(
                            child: Text("Sign Up",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color(0xff81AE4F), fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          )
                      )
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
