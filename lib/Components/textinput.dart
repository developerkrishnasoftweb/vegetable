import 'package:flutter/material.dart';

Widget input({@required BuildContext context, InputDecoration decoration, TextStyle style, GestureTapCallback onTap, TextEditingController controller, bool obscureText, ValueChanged<String> onChanged, String text}){
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    width: size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text ?? " ",
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color(0xffA8A8A8), fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10,),
        TextField(
          decoration: decoration ?? null,
          style: style ?? null,
          onTap: onTap ?? null,
          controller: controller ?? null,
          obscureText: obscureText ?? false,
          onChanged: onChanged ?? null,
        ),
      ],
    ),
  );
}