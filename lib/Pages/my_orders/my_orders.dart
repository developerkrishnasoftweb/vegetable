import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/appbar.dart';
import '../../Components/page_route.dart';
import '../../Pages/my_orders/order_details.dart';
import '../../services/urls.dart';
import '../../services/services.dart';
import '../cart/cart.dart';

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
      if (value.response == 1) {
        for (int i = 0; i < value.data.length; i++) {
          for (int j = 0; j < value.data[i]["products"].length; j++) {
            setState(() {
              orders += [
                OrderDetail(
                    image: value.data[i]["products"][j]["image"].toString(),
                    desc: value.data[i]["products"][j]["short_info"].toString(),
                    orderProgress: value.data[i]["order_progress"].toString(),
                    orderId: value.data[i]["id"].toString(),
                    /*
                    * api
                    * */
                    name: value.data[i]["name"].toString(),
                    email: value.data[i]["email"].toString(),
                    address1: value.data[i]["address1"].toString(),
                    address2: value.data[i]["address2"].toString(),
                    addressType: value.data[i]["type"].toString(),
                    customerId: value.data[i]["customer_id"].toString(),
                    paymentMode: value.data[i]["payment_mode"].toString(),
                    state: value.data[i]["state"].toString(),
                    area: value.data[i]["area"].toString(),
                    city: value.data[i]["city"].toString(),
                    convertedAmount:
                        value.data[i]["converted_amount"].toString(),
                    currency: value.data[i]["currency"].toString(),
                    landmark: value.data[i]["landmark"].toString(),
                    mobile: value.data[i]["mobile"].toString(),
                    orderDate: value.data[i]["order_date"].toString(),
                    orderNo: value.data[i]["order_no"].toString(),
                    orderTime: value.data[i]["order_time"].toString(),
                    orderType: value.data[i]["order_type"].toString(),
                    pinCode: value.data[i]["pincode"].toString(),
                    referenceNo: value.data[i]["reference_no"].toString(),
                    totalPrice: value.data[i]["total_price"].toString(),
                    transactionType:
                        value.data[i]["transaction_type"].toString(),
                    products: [
                      ProductInfo(
                          total:
                              value.data[i]["products"][j]["total"].toString(),
                          shortInfo: value.data[i]["products"][j]["short_info"]
                              .toString(),
                          quantity: value.data[i]["products"][j]["quantity"]
                              .toString(),
                          productId: value.data[i]["products"][j]["product_id"]
                              .toString(),
                          title:
                              value.data[i]["products"][j]["title"].toString(),
                          image:
                              value.data[i]["products"][j]["image"].toString())
                    ],
                    deliveryStatus: "Delivery expected by Sat, Nov 12")
              ];
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "My Orders",
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
                    Navigator.push(context, CustomPageRoute(widget: OrderDesc(order: orders[index],)));
                  },
                  child: Container(
                    height: 150,
                    width: size.width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey[200], width: 1.5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          height: size.width * 0.25,
                          width: size.width * 0.25,
                          image: NetworkImage(
                              Urls.imageBaseUrl + orders[index].products[0].image),
                          fit: BoxFit.fill,
                        ),
                        Container(
                          height: 150,
                          width: size.width * 0.75 - 60,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orders[index].deliveryStatus,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                orders[index].products[0].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Colors.black54,
                                    ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                              Text(
                                "Rate this product",
                                style: Theme.of(context).textTheme.bodyText1,
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
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                  strokeWidth: 1.4,
                ),
              ),
            ),
    );
  }
}

class OrderDetail {
  final String image,
      desc,
      orderProgress,
      orderId,
      deliveryStatus,
      orderNo,
      customerId,
      name,
      email,
      mobile,
      address1,
      address2,
      landmark,
      area,
      pinCode,
      state,
      city,
      addressType,
      orderDate,
      orderTime,
      totalPrice,
      convertedAmount,
      currency,
      orderType,
      paymentMode,
      transactionType,
      referenceNo;
  List<ProductInfo> products;
  OrderDetail({
    this.image,
    this.orderProgress,
    this.desc,
    this.orderId,
    this.deliveryStatus,
    this.email,
    this.name,
    this.mobile,
    this.city,
    this.area,
    this.addressType,
    this.state,
    this.pinCode,
    this.landmark,
    this.customerId,
    this.address1,
    this.address2,
    this.convertedAmount,
    this.currency,
    this.orderDate,
    this.orderNo,
    this.orderTime,
    this.orderType,
    this.paymentMode,
    this.products,
    this.referenceNo,
    this.totalPrice,
    this.transactionType,
  });
}

class ProductInfo {
  String productId, title, shortInfo, image, quantity, total;
  ProductInfo(
      {this.shortInfo,
      this.total,
      this.quantity,
      this.productId,
      this.image,
      this.title});
}
