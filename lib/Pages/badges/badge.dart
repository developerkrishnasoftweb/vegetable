import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/services/services.dart';

Stack badge({@required IconButton iconButton, BuildContext context, Color badgeColor, int badgeValue, Size badgeSize, double top, double bottom, double left, double right}){
  return Stack(
    children: [
      Positioned(
        top: top ?? 0,
        right: right ?? 0,
        left: left ?? null,
        bottom: bottom ?? null,
        child: Container(
          height: badgeSize.height ?? 15,
          width: badgeSize.width ?? 15,
          alignment: Alignment.center,
          child: Text(badgeValue.toString(), style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white, fontSize: 8),),
          decoration: BoxDecoration(
              color: badgeColor ?? Colors.black,
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
      iconButton
    ],
  );
}

class Badges{
  static dynamic getCartCount({Future<dynamic> customerId}){
    customerId.then((value) {
      FormData body = FormData.fromMap({
        "customer_id" : value.toString()
      });
      Services.getCartCount(body).then((value) {
        if(value.response == 1)
          return int.parse(value.data[0]["total"]);
      });
    });
    return 0;
  }

  static dynamic customerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return int.parse(jsonDecode(sharedPreferences.getString("userData"))[0]["id"]);
  }
}