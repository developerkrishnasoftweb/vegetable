import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/appbar.dart';
import '../../Components/customButton.dart';
import '../../Components/itemBuilder.dart';
import '../../Pages/badges/badge.dart';
import '../../Pages/cart/cart.dart';
import '../../Pages/home.dart';
import '../../services/services.dart';
import '../../services/urls.dart';

class ProductDesc extends StatefulWidget {
  final String id;
  ProductDesc({@required this.id});

  @override
  _ProductDescState createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  int quantity = 0, cartCount = 0;
  String measure = "--";
  List<AddItems> _item1 = [
    AddItems(
        image: AssetImage("assets/images/loading.gif"),
        displayPrice: "00",
        price: "00",
        title: "----",
        id: null)
  ];
  ImageProvider imageProvider;
  String price = "0", shortInfo = "----", longInfo = "----", productId, cartId;
  bool checkCartStatus = false, add = false, remove = false;

  @override
  void initState() {
    getProducts();
    getProductData();
    checkStatus();
    super.initState();
  }

  void getProducts() async {
    await Services.getProducts().then((value) {
      if (value.response == 1) {
        for (int i = 0; i < value.data.length; i++) {
          setState(() {
            _item1 += [
              AddItems(
                  title: value.data[i]["title"],
                  id: value.data[i]["id"],
                  price: value.data[i]["price"],
                  displayPrice: value.data[i]["display_price"],
                  image:
                      NetworkImage(Urls.imageBaseUrl + value.data[i]["image"]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDesc(
                                  id: value.data[i]["id"],
                                )));
                  })
            ];
          });
        }
      } else
        Fluttertoast.showToast(msg: value.message);
    });
    _item1.removeAt(0);
  }

  void getProductData() async {
    FormData formData = FormData.fromMap({
      "product_id": widget.id,
    });
    await Services.getProduct(formData).then((value) {
      if (value.response == 1) {
        setState(() {
          imageProvider =
              NetworkImage(Urls.imageBaseUrl + value.data[0]["image"]);
          price = value.data[0]["price"];
          measure = value.data[0]["unit"];
          shortInfo = value.data[0]["short_info"];
          longInfo = value.data[0]["long_info"];
          productId = value.data[0]["id"];
        });
      } else
        Fluttertoast.showToast(msg: value.message);
    });
  }

  void checkStatus() async {
    String customerId;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      customerId = sharedPreferences.getString("id");
    });
    if (customerId != null && widget.id != null) {
      FormData formData = FormData.fromMap({
        "product_id": widget.id,
        "customer_id": customerId,
      });
      await Services.checkCartStatus(formData).then((value) {
        if (value.response == 1) {
          setState(() {
            checkCartStatus = true;
            quantity = int.parse(value.data[0]["quantity"]);
            cartId = value.data[0]["id"];
          });
        } else
          setState(() => quantity = 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getCartCount();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        context: context,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          badge(
            context: context,
            iconButton: IconButton(
                icon: ImageIcon(
                  AssetImage("assets/icons/shopping-cart.png"),
                  color: Colors.black,
                ),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));}),
            badgeValue: cartCount,
            badgeColor: Colors.green,
            badgeSize: Size(15, 15),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 70, left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: size.width * 0.7,
                      width: size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 7,
                                spreadRadius: -3,
                                offset: Offset(2, 2)),
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 7,
                                spreadRadius: -1,)
                          ]),
                      child: imageProvider == null
                          ? SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.green),
                                strokeWidth: 2,
                              ),
                            )
                          : Image(
                              height: 200,
                              width: 200,
                              image: imageProvider,
                              fit: BoxFit.fill,
                            )),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    shortInfo,
                    style: TextStyle(fontSize: 23, color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\u20B9\t" + price,
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              child: InkWell(
                                onTap: !remove ? removeQuantity : null,
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 30,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green,
                                  ),
                                  child: remove
                                      ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white), strokeWidth: 1.5,),)
                                      : Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              quantity.toString().padLeft(2, '0') +
                                  " " +
                                  measure.toUpperCase(),
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              child: InkWell(
                                onTap: !add ? updateQuantity : null,
                                child: Container(
                                  height: 30,
                                  width: 35,
                                  child: add
                                      ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white), strokeWidth: 1.5,),)
                                      : Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green,
                                  ),
                                  alignment: Alignment.center,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      "Description :",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      longInfo,
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      "Related Products",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: ItemBuilder(items: _item1,),
                    height: 200,
                    width: size.width,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: !checkCartStatus
                ? button(
                    context: context,
                    onPressed: addToCart,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/icons/cart-bag.png"),
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          " ADD TO BAG",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Color(0xffffffff),
                                fontSize: 18,
                              ),
                        )
                      ],
                    ),
                    height: 60)
                : button(
                    color: Colors.redAccent,
                    context: context,
                    onPressed: removeFromCart,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/icons/remove-from-bag.png"),
                          color: Colors.white,
                          size: 26,
                        ),
                        Text(
                          " REMOVE FROM BAG",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Color(0xffffffff),
                                fontSize: 18,
                              ),
                        )
                      ],
                    ),
                    height: 60,),
          )
        ],
      ),
    );
  }

  void addToCart() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String customerId;
    setState(() {
      customerId = sharedPreferences.getString("id");
    });
    if (customerId != null && productId != null) {
      FormData formData = FormData.fromMap({
        "customer_id": customerId,
        "product_id": productId,
        "quantity": quantity,
      });
      Services.addToCart(formData).then((value) {
        print(value.message);
        if (value.response == 1) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
          Fluttertoast.showToast(msg: value.message);
        } else
          Fluttertoast.showToast(msg: value.message);
      });
    } else {}
  }

  void removeFromCart() {
    if(cartId != null){
      FormData formData = FormData.fromMap({
        "cart_id": cartId
      });
      Services.removeFromCart(formData).then((value) {
        if(value.response == 1){
          Fluttertoast.showToast(msg: value.message);
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDesc(id: widget.id)));
        }
      });
    } else Fluttertoast.showToast(msg: "Something went wrong !!!");
  }

  void removeQuantity() {
    if(checkCartStatus){
      if(cartId != null){
        setState(() {
          remove = true;
          if(quantity > 1)
            quantity -= 1;
        });
        FormData formData = FormData.fromMap({
          "cart_id" : cartId,
          "quantity" : quantity,
        });
        Services.updateQuantity(formData).then((value) {
          if(value.response == 1){
            setState(() {
              remove = false;
            });
            Fluttertoast.showToast(msg: value.message);
          } else {
            setState(() {
              remove = false;
            });
          }
        });
      }
    } else {
      setState(() {
        if(quantity > 1)
          quantity -= 1;
      });
    }
  }

  void updateQuantity() {
    if(checkCartStatus){
      if(cartId != null){
        setState(() {
          add = true;
          quantity += 1;
        });
        FormData formData = FormData.fromMap({
          "cart_id" : cartId,
          "quantity" : quantity,
        });
        Services.updateQuantity(formData).then((value) {
          if(value.response == 1){
            setState(() {
              add = false;
            });
            Fluttertoast.showToast(msg: value.message);
          } else {
            setState(() {
              add = false;
            });
          }
        });
      }
    } else {
      setState(() {
        quantity += 1;
      });
    }
  }

  void getCartCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FormData body = FormData.fromMap({
      "customer_id" : int.parse(jsonDecode(sharedPreferences.getString("userData"))[0]["id"]).toString()
    });
    Services.getCartCount(body).then((value) {
      if(value.response == 1)
        setState(() {
          cartCount = int.parse(value.data[0]["total"]);
        });
    });
  }
}
