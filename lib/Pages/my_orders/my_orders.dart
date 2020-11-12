import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/services.dart';
import '../cart/cart.dart';
import '../badges/badge.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int cartCount = 0;

  @override
  void initState() {
    getCartCount();
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
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
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
                      image: AssetImage("assets/productImages/tomato.png"),
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
                            "Delivery expected by Sat, Nov 12",
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
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
          }),
    );
  }
}

class OrderDetail{
  String image, desc, deliveryStatus, id;
  OrderDetail({this.image, this.deliveryStatus, this.desc, this.id});
}