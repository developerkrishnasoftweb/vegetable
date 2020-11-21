import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/text_textrow.dart';
import '../../services/urls.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context: context, title: "Order Detail"),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey[400]))
              ),
              child: text(text: "Order ID - OD" + widget.order.orderNo, context: context),
            ),
            ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.order.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    backgroundColor: Colors.white,
                    initiallyExpanded: true,
                    childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                    leading: Image(
                      height: 40,
                      width: 40,
                      image: NetworkImage(Urls.imageBaseUrl +
                          widget.order.products[index]["image"]),
                      fit: BoxFit.fill,
                    ),
                    title: Text(widget.order.products[index]["title"] + " (${widget.order.products[index]["short_info"]}) ", style: Theme.of(context).textTheme.bodyText1,),
                    children: [
                      descList(context: context, title: "Quantity", amount: widget.order.products[index]["quantity"], lead: "X"),
                      descList(context: context, title: "Price", amount: widget.order.products[index]["price"], showRupeeSymbol: "\u20B9"),
                      Divider(indent: 0, height: 0),
                      descList(context: context, title: "Total", amount: widget.order.products[index]["total"], showRupeeSymbol: "\u20B9"),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          text(context: context, text: "Rate this product"),
                          Spacer(),
                          for(int i = 0; i < 5; i++)...[
                            Icon(Icons.star_border, size: 20,),
                          ]
                        ],
                      ),
                      SizedBox(height: 5,)
                    ],
                  );
                }),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(text: "Shipping Detail", context: context),
                  SizedBox(height: 20,),
                  text(context: context, text: widget.order.name),
                  text(context: context, text: widget.order.address1),
                  text(context: context, text: widget.order.address2),
                  text(context: context, text: widget.order.city),
                  text(context: context, text: widget.order.state + " - " + widget.order.pinCode),
                  text(context: context, text: "Phone number : " + widget.order.mobile),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(text: "Price Detail", context: context),
                  SizedBox(height: 10,),
                  descList(context: context, title: "Total Amount", amount: widget.order.totalPrice),
                  text(context: context, text: "\u2022 " + widget.order.orderType + " : " + widget.order.totalPrice),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}