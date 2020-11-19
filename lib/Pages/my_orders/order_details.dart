import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/appbar.dart';
import '../../Pages/my_orders/my_orders.dart';

class OrderDesc extends StatefulWidget {
  final OrderDetail order;
  OrderDesc({this.order});
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "Order Detail"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.order.products[0].image, style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
