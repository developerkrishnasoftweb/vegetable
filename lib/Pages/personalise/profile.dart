import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/Components/userdata.dart';
import 'package:vegetable/services/services.dart';
import 'dart:math';

import 'package:vegetable/services/urls.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController FULLNAME = TextEditingController();
  TextEditingController EMAIL = TextEditingController();
  TextEditingController MOBILE = TextEditingController();
  String fullName, email, mobile;
  String gender = "Male", image;
  bool isLoading = true;
  Icon dangerIcon = Icon(Icons.info_outline, color: Colors.red,);
  Icon primaryIcon = Icon(Icons.check_circle_outline, color: Colors.blue,);
  var userData;
  List<Color> colors = [
    Color(0xff008744),
    Color(0xff0057e7),
    Color(0xffd62d20),
    Color(0xffffa700),
    Color(0xff0c1b32)
  ];
  @override
  void initState() {
    getProfileData();
    super.initState();
  }

  getProfileData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userData = jsonDecode(sharedPreferences.getString("userData"));
      FULLNAME.text = fullName = userData[0]["first_name"] + " " + userData[0]["last_name"];
      EMAIL.text = email = userData[0]["email"];
      MOBILE.text = mobile = userData[0]["mobile"];
      gender = userData[0]["gender"];
      image = userData[0]["image"];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            "Edit Profile",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
          actions: [
            FlatButton.icon(
                onPressed: save,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                label: Text(
                  "SAVE",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white, fontSize: 15),
                ))
          ],
          backgroundColor: Color(0xff0c1b32),
        ),
        body: isLoading
            ? Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(colors[Random().nextInt(colors.length)]),
                    backgroundColor: Color(0xffeeeeee),
                    strokeWidth: 1.5,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: size.width,
                      alignment: Alignment.center,
                      color: Color(0xff0c1b32),
                      child: Container(
                        height: 180,
                        width: 180,
                        alignment: Alignment(0.9, 1.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(Urls.imageBaseUrl + image),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(100)),
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: FlatButton(
                            onPressed: () {},
                            child: ImageIcon(
                              AssetImage("assets/icons/camera.png"),
                              color: Colors.white,
                              size: 30,
                            ),
                            padding: EdgeInsets.zero,
                            color: Color(0xffef3528),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    ),
                    input(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        context: context,
                        title: "Full Name",
                        inputDecoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (value){
                          setState(() {
                            fullName = value;
                          });
                        },
                        textEditingController: FULLNAME),
                    input(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        context: context,
                        title: "Email",
                        inputDecoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          contentPadding: EdgeInsets.zero,
                          suffixIcon: RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email) ? primaryIcon : dangerIcon,
                          suffixIconConstraints: BoxConstraints()
                        ),
                        textEditingController: EMAIL,
                        onChanged: (value){
                          setState(() {
                            email = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress),
                    input(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        context: context,
                        title: "Mobile",
                        inputDecoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          contentPadding: EdgeInsets.zero,
                          suffixIcon: RegExp(r"^(?:[+0]9)?[0-9]{10}$")
                              .hasMatch(mobile) ? primaryIcon : dangerIcon,
                          suffixIconConstraints: BoxConstraints()
                        ),
                        onChanged: (value){
                          setState(() {
                            mobile = value;
                          });
                        },
                        textEditingController: MOBILE,
                        keyboardType: TextInputType.phone),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Gender",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: size.width,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: DropdownButton(
                          items: ["Male", "Female"].map((gender) {
                            return DropdownMenuItem(
                                value: gender.toLowerCase(),
                                child: Text(
                                  gender,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 15, color: Colors.black),
                                ));
                          }).toList(),
                          value: gender.toLowerCase(),
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          }),
                    )
                  ],
                ),
              ));
  }

  void save() {
  }
}

Widget input(
    {String title,
    TextEditingController textEditingController,
    double width,
    @required BuildContext context,
    InputDecoration inputDecoration,
    TextStyle style,
    GestureTapCallback onTap,
    bool readOnly,
    TextInputType keyboardType,
    ValueChanged<String> onChanged,
    double height,
    EdgeInsets padding,
    EdgeInsets margin,
    bool obSecureText}) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: height != null ? height + 20 : 75,
    width: width ?? size.width,
    padding: padding,
    margin: margin,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 14, color: Colors.black38, fontWeight: FontWeight.bold),
        ),
        TextField(
          style: style,
          decoration: inputDecoration,
          onTap: onTap,
          readOnly: readOnly ?? false,
          keyboardType: keyboardType,
          controller: textEditingController,
          onChanged: onChanged,
          obscureText: obSecureText ?? false,
        ),
      ],
    ),
  );
}
