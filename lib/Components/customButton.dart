
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegetable/constant/colors.dart';

dynamic button({@required BuildContext context, double height, String text, @required VoidCallback onPressed, Widget child, double width, Color color, EdgeInsets padding}){
  Size size = MediaQuery.of(context).size;
  Widget childData;
  if(text != null && text != "") {
    childData = Text(text ?? " ",
      style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colours.buttonTextColor, fontSize: 18,),
    );
  } else if(child != null) {
    childData = child;
  } else return;

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    width: width ?? size.width,
    height: height ?? 0,
    child: FlatButton(
      padding: padding ?? null,
      child: childData,
      color: color ?? Colours.primaryColor,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    ),
  );
}