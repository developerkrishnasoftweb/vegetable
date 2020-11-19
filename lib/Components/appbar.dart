import 'package:flutter/material.dart';
import 'package:vegetable/constant/colors.dart';

AppBar appBar(
    {@required BuildContext context,
    String title,
    List<Widget> actions,
    ShapeBorder shape,
    Widget leading,
    bool centerTitle,
    Color backgroundColor,
    Color leadingColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colours.primaryColor,
    title: Text(
      title != null ? title : "",
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1),
    ),
    actions: actions,
    shape: shape ?? null,
    leading: leading,
    elevation: 0,
    centerTitle: centerTitle ?? false,
    iconTheme: IconThemeData(color: leadingColor ?? Colors.white, size: 22),
  );
}
