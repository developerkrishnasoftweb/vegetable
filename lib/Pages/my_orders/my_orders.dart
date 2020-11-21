import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/Components/badge.dart';
import 'package:vegetable/Components/text_textrow.dart';
import 'package:vegetable/Components/userdata.dart';
import '../../Components/appbar.dart';
import '../../Components/page_route.dart';
import '../../Pages/my_orders/order_details.dart';
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
          setState(() {
            orders += [
              OrderDetail(
                  orderId: value.data[i]["id"].toString(),
                  orderNo: value.data[i]["order_no"].toString(),
                  customerId: value.data[i]["customer_id"].toString(),
                  name: value.data[i]["name"].toString(),
                  email: value.data[i]["email"].toString(),
                  mobile: value.data[i]["mobile"].toString(),
                  address1: value.data[i]["address1"].toString(),
                  address2: value.data[i]["address2"].toString(),
                  landmark: value.data[i]["landmark"].toString(),
                  area: value.data[i]["area"].toString(),
                  pinCode: value.data[i]["pincode"].toString(),
                  state: value.data[i]["state"].toString(),
                  city: value.data[i]["city"].toString(),
                  addressType: value.data[i]["type"].toString(),
                  orderDate: value.data[i]["order_date"].toString(),
                  orderTime: value.data[i]["order_time"].toString(),
                  totalPrice: value.data[i]["total_price"].toString(),
                  convertedAmount: value.data[i]["converted_amount"].toString(),
                  currency: value.data[i]["currency"].toString(),
                  orderType: value.data[i]["order_type"].toString(),
                  paymentMode: value.data[i]["payment_mode"].toString(),
                  transactionType: value.data[i]["transaction_type"].toString(),
                  referenceNo: value.data[i]["reference_no"].toString(),
                  products: value.data[i]["products"],
                  deliveryStatus: "Delivery expected by Sat, Nov 12")
            ];
          });
        }
      } else {
        setState(() {
          orders = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(orders.length);
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
            badge(
              context: context,
              iconButton: IconButton(
                  splashRadius: 25,
                  icon: ImageIcon(
                    AssetImage("assets/icons/shopping-cart.png"),
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, CustomPageRoute(widget: Cart()));
                  }),
              badgeValue: UserData.cartCount,
              badgeColor: Colors.green,
              badgeSize: Size(15, 15),
            ),
          ],
        ),
        body: orders != null
            ? orders.length != 0
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CustomPageRoute(
                                  widget: OrderDesc(
                                order: orders[index],
                              )));
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
                              Container(
                                height: 150,
                                width: size.width - 30,
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
                                    text(
                                        text: orders[index].name,
                                        context: context),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 5.0, bottom: 3),
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 3,
                                          right: 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.blue)),
                                      child: Text(
                                        orders[index].addressType.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                fontSize: 10,
                                                color: Colors.blue),
                                      ),
                                    ),
                                    text(
                                        text: orders[index].address1,
                                        context: context),
                                    text(
                                        text: orders[index].orderDate,
                                        context: context)
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
                  )
            : Center(
                child: text(
                    context: context, text: "You haven't placed any order :)"),
              ));
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
  List products;
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
