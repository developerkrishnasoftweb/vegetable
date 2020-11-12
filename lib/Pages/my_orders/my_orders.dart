import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/services/urls.dart';
import '../../services/services.dart';
import '../cart/cart.dart';
import '../badges/badge.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int cartCount = 0;
  List<OrderDetail> orders = [];
  @override
  void initState() {
    getCartCount();
    myOrders();
    super.initState();
  }

  void getCartCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FormData body = FormData.fromMap({
      "customer_id": int.parse(
              jsonDecode(sharedPreferences.getString("userData"))[0]["id"])
          .toString()
    });
    Services.getCartCount(body).then((value) {
      if (value.response == 1)
        setState(() {
          cartCount = int.parse(value.data[0]["total"]);
        });
    });
  }
  void myOrders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FormData body = FormData.fromMap({
      "customer_id": int.parse(
          jsonDecode(sharedPreferences.getString("userData"))[0]["id"])
          .toString()
    });
    Services.myOrders(body).then((value) {
      if(value.response == 1){
        for(int i = 0; i < value.data.length; i++){
          setState(() {
            orders += [OrderDetail(image: value.data[i]["image"].toString(), desc: value.data[i]["short_info"].toString(), orderProgress: value.data[i]["order_progress"].toString(), orderId: value.data[i]["id"].toString(), deliveryStatus: "Delivery expected by Sat, Nov 12")];
          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF81ae4f),
        title: Text(
          "My Orders",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            splashRadius: 25,
          ),
          IconButton(
              splashRadius: 25,
              icon: ImageIcon(
                AssetImage("assets/icons/shopping-cart.png"),
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              })
        ],
      ),
      body: orders.length != 0
        ? ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
              },
              child: Container(
                height: 150,
                width: size.width,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[200], width: 1.5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      image: NetworkImage(Urls.imageBaseUrl + orders[index].image),
                      fit: BoxFit.fill,
                    ),
                    Container(
                      height: 150,
                      width: size.width * 0.75 - 60,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orders[index].deliveryStatus,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            orders[index].desc,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.black54,
                                    ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          })
        : Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.green), strokeWidth: 1.4,),
        )),
    );
  }
}

class OrderDetail{
  final String image, desc, orderProgress, orderId, deliveryStatus;
  OrderDetail({this.image, this.orderProgress, this.desc, this.orderId, this.deliveryStatus});
}