import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/appbar.dart';
import '../../Components/userdata.dart';
import '../../services/services.dart';
import 'dart:math';
import '../../services/urls.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController FULLNAME = TextEditingController();
  TextEditingController EMAIL = TextEditingController();
  TextEditingController MOBILE = TextEditingController();
  String fullName, email, mobile;
  String gender = "Select Gender", image;
  bool isLoading = true, isSaving = false;
  File _image;
  final ImagePicker imagePicker = ImagePicker();
  Icon dangerIcon = Icon(
    Icons.info_outline,
    color: Colors.red,
  );
  Icon primaryIcon = Icon(
    Icons.check_circle_outline,
    color: Colors.blue,
  );
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
      FULLNAME.text =
          fullName = userData[0]["first_name"] + " " + userData[0]["last_name"];
      EMAIL.text = email = userData[0]["email"];
      MOBILE.text = mobile = userData[0]["mobile"];
      userData[0]["gender"] != null ? gender = userData[0]["gender"] : gender = "select gender";
      image = userData[0]["image"];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBar(
          context: context,
          title: "Edit Profile",
          centerTitle: true,
          actions: [
            FlatButton.icon(
                onPressed: isSaving ? null : save,
                padding: EdgeInsets.zero,
                icon: isSaving
                    ? SizedBox.shrink()
                    : Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                label: isSaving
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : Text(
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
                    valueColor: AlwaysStoppedAnimation(
                        colors[Random().nextInt(colors.length)]),
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
                      height: 250,
                      width: size.width,
                      alignment: Alignment.center,
                      color: Color(0xff0c1b32),
                      child: Container(
                        height: 180,
                        width: 180,
                        alignment: Alignment(0.9, 1.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: _image == null ? NetworkImage(Urls.imageBaseUrl + image) : AssetImage(_image.path),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(100)),
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: FlatButton(
                            onPressed: () async {
                              final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
                              setState(() {
                                if(pickedFile != null){
                                  _image = File(pickedFile.path);
                                }
                              });
                            },
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
                        onChanged: (value) {
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
                            suffixIcon:
                                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(email)
                                    ? primaryIcon
                                    : dangerIcon,
                            suffixIconConstraints: BoxConstraints()),
                        textEditingController: EMAIL,
                        onChanged: (value) {
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
                                    .hasMatch(mobile)
                                ? primaryIcon
                                : dangerIcon,
                            suffixIconConstraints: BoxConstraints()),
                        onChanged: (value) {
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
                          isExpanded: true,
                          items: ["Select Gender", "Male", "Female"].map((gender) {
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

  void save() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String firstName, lastName;
    setState(() {
      isSaving = true;
      firstName =
          fullName.split(" ")[0] != null ? fullName.split(" ")[0] : null;
      lastName = fullName.split(" ").length > 2 ? fullName.split(" ")[1] : "";
    });
    if (firstName != null && lastName != null) {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)) {
        if (RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(mobile)) {
          FormData formData = FormData.fromMap({
            "customer_id": sharedPreferences.getString("id"),
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "mobile": mobile,
            "gender": gender,
            "image": _image != null ? await MultipartFile.fromFile(_image.path, filename: "user.png") : null,
          });
          Services.updateProfile(formData).then((value) {
            if(value.response == 1){
              setState(() {
                UserData.firstName = value.data[0]["first_name"];
                UserData.lastName = value.data[0]["last_name"];
                UserData.email = value.data[0]["email"];
                UserData.mobile = value.data[0]["mobile"];
                UserData.gender = value.data[0]["gender"];
                UserData.image = value.data[0]["image"];
                image = value.data[0]["image"];
              });
              sharedPreferences.setString("userData", jsonEncode(value.data).toString());
              setState(() => isSaving = false);
              Fluttertoast.showToast(msg: value.message);
            } else {
              setState(() => isSaving = false);
            }
          });
        } else {
          setState(() => isSaving = false);
          Fluttertoast.showToast(msg: "Invalid mobile number");
        }
      } else {
        setState(() => isSaving = false);
        Fluttertoast.showToast(msg: "Invalid email address");
      }
    }
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
