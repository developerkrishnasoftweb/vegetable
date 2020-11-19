import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/appbar.dart';
import '../../constant/colors.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedBack> {
  List<String> improveList = [
    "Overall Service",
    "Customer Support",
    "Speed and Efficiency",
    "Repair Quality",
    "Pickup and Delivery Service",
    "Transparency"
  ];
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
              Row(children: [
                for (int i = 0; i < 5; i++) ...[
                  Icon(
                    Icons.star_border,
                    size: 40,
                  ),
                ],
              ]),
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
                  )
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 80,
        width: size.width,
        alignment: Alignment.center,
        color: Colours.backgroundColor,
        child: SizedBox(
          height: 50,
          width: size.width * 0.8,
          child: FlatButton(
            onPressed: (){},
            color: Colors.grey[100],
            textColor: Colors.white,
            child: Text(
              "Submit",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }
}
