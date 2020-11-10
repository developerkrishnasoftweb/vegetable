
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic button({@required BuildContext context, double height, String text, @required VoidCallback onPressed, Widget child, double width, Color color}){
  Size size = MediaQuery.of(context).size;
  Widget childData;
  if(text != null && text != "") {
    childData = Text(text ?? " ",
      style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color(0xffffffff), fontSize: 18,),
    );
  } else if(child != null) {
    childData = child;
  } else return;

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    width: width ?? size.width,
    height: height ?? 0,
    child: FlatButton(
      child: childData,
      color: color ?? Color(0xff81AE4F),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    ),
  );
}