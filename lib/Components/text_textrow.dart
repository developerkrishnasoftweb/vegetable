import 'package:flutter/material.dart';

Widget descList({String title, String amount, String lead, @required BuildContext context, String showRupeeSymbol}) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title + " :", style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),),
        Text((lead != null ? lead : "") + " " + (showRupeeSymbol != null ? showRupeeSymbol : " ").toString() + " " + amount, style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
      ],
    ),
  );
}

Widget text({@required BuildContext context, String text}){
  return Text(text,
    style: Theme.of(context).textTheme.bodyText1,
  );
}