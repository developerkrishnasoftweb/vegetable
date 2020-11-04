
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button({@required BuildContext context, double height, String text, @required VoidCallback onPressed}){
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    width: size.width,
    height: height ?? 0,
    child: FlatButton(
      child: Text(text ?? " ",
        style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color(0xffffffff), fontSize: 18,),
      ),
      color: Color(0xff81AE4F),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    ),
  );
}