import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vegetable/Components/rating_builder.dart';
import 'package:vegetable/Components/userdata.dart';
import 'package:vegetable/services/services.dart';
import '../../Components/appbar.dart';
import '../../constant/colors.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedBack> {
  TextEditingController message = TextEditingController();
  List<String> improveList = [
    "Overall Service",
    "Customer Support",
    "Speed and Efficiency",
    "Repair Quality",
    "Pickup and Delivery Service",
    "Transparency"
  ];
  String msg;
  int feedback = 0;
  bool isSending = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "FeedBack",
        backgroundColor: Colours.primaryColor,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 20, bottom: 120),
        child: Container(
          width: size.width,
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rate Your Experience",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 25),
              ),
              Text(
                "Are you satisfied with the service?",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black45, fontSize: 12),
              ),
              SizedBox(
                height: 20,
              ),
              RatingBuilder(
                onChanged: (value){
                  setState(() {
                    print(value);
                    feedback = value;
                  });
                },
                iconList: [
                  Icons.sentiment_very_dissatisfied,
                  Icons.sentiment_dissatisfied,
                  Icons.sentiment_neutral,
                  Icons.sentiment_satisfied,
                  Icons.sentiment_very_satisfied
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tell us what can be improved?",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Container(
                width: size.width / 2,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(improveList[1], style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 13),),
              ),
              SizedBox(height: 40,),
              TextField(
                controller: message,
                maxLines: 7,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.grey)),
                  hintText: "Tell us on how can we improve ...",
                  hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 12, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    msg = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 80,
        width: size.width,
        alignment: Alignment.center,
        child: SizedBox(
          height: 50,
          width: size.width * 0.8,
          child: FlatButton(
            onPressed: msg != null ? msg.length > 0 ? feedback > 0 ? addFeedBack : null : null : null,
            color: isSending ? Colors.white : msg != null ? msg.length > 0 ? feedback > 0 ? Colours.primaryColor : Colors.grey[100] : Colors.grey[100] : Colors.grey[100],
            child: isSending
              ? SizedBox(height: 30, width: 30, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colours.colors[Random().nextInt(Colours.colors.length)]), strokeWidth: 1.5,),)
              : Text(
              "Submit",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 16, color: msg != null ? msg.length > 0 ? feedback > 0 ? Color(0xffFFffff) : Colors.grey : Colors.grey : Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }

  void addFeedBack() {
    setState(() => isSending = true);
    FormData formData = FormData.fromMap({
      "customer_id" : UserData.id,
      "name" : UserData.firstName,
      "mobile" : UserData.mobile,
      "email" : UserData.email,
      "feedback" : msg,
      "rating" : feedback,
    });
    Services.addFeedBack(formData).then((value) {
      if(value.response == 1){
        setState(() => isSending = false);
        message.clear();
        Navigator.pop(context);
        Fluttertoast.showToast(msg: value.message);
      } else {
        Fluttertoast.showToast(msg: value.message);
        setState(() => isSending = false);}
    });
  }
}
