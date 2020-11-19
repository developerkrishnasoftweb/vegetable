import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/appbar.dart';
import '../../Components/textinput.dart';
import '../../constant/colors.dart';

class Contact extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Contact> {
  TextEditingController email = TextEditingController(text: "info@gmail.com");
  TextEditingController phone = TextEditingController(text: "(+91) 875 843 1417");
  TextEditingController message = TextEditingController(text: "Type your message here ...");
  String EMAIL, PHONE, MESSAGE;
  bool change = false;
  changeSendButtonColor(){
    if(EMAIL != "" && EMAIL != null && PHONE != "" && PHONE != null && MESSAGE != "" && MESSAGE != null)
      setState(() => change = true);
    else  setState(() => change = false);
  }
  @override
  Widget build(BuildContext context) {
    changeSendButtonColor();
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "Contact Us",
        backgroundColor: Colours.primaryColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            input(context: context,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail_outline, color: Colors.blue,),
                labelText: "Email",
                labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.blue)
              ),
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colours.textLightColor),
              controller: email,
                keyboardType: TextInputType.emailAddress,
                onTap: (){
                  if(EMAIL == null){
                    setState(() {
                      email.clear();
                    });
                  }
                },
                onChanged: (value){
                  setState(() {
                    EMAIL = value;
                  });
                }
            ),
            input(context: context,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: Colors.blue,),
                    labelText: "Phone",
                    labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.blue)
                ),
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colours.textLightColor),
                controller: phone,
                keyboardType: TextInputType.phone,
                onTap: (){
                  if(PHONE == null){
                    setState(() {
                      phone.clear();
                    });
                  }
                },
                onChanged: (value){
                  setState(() {
                    PHONE = value;
                  });
                }
            ),
            input(context: context,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.chat_bubble_outline, color: Colors.blue,),
                    labelText: "Message",
                    labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.blue)
                ),
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colours.textLightColor),
                controller: message,
                onTap: (){
                  if(MESSAGE == null){
                    setState(() {
                      message.clear();
                    });
                  }
                },
                onChanged: (value){
                  setState(() {
                    MESSAGE = value;
                  });
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.send, color: change ? Colors.white : Colours.primaryColor, size: 20,),
        elevation: 0,
        backgroundColor: change ? Colours.primaryColor : Colors.grey[200],
      ),
    );
  }
}
