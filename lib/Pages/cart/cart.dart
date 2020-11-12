import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/Components/customButton.dart';
import 'package:vegetable/Pages/cart/place_order.dart';
import 'package:vegetable/Pages/product_description/productDesc.dart';
import 'package:vegetable/services/services.dart';
import 'package:vegetable/services/urls.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  GlobalKey globalKey = GlobalKey();
  List<CartItem> items = [];
  double total = 0;
  bool isLoading = true, add = false, remove = false, isCartEmpty = false;
  List<Color> colors = [
    Color(0xff008744),
    Color(0xff0057e7),
    Color(0xffd62d20),
    Color(0xffffa700),
    Color(0xff0c1b32)
  ];

  @override
  void initState() {
    getCartData();
    super.initState();
  }
  void getCartData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String customerId;
    setState(() {
      customerId = sharedPreferences.getString("id");
    });
    FormData formData = FormData.fromMap({
      "customer_id" : customerId
    });
    Services.viewCart(formData).then((value) {
      if(value.response == 1){
        setState(() {
          total = 0;
          isLoading = false;
        });
        for(int i = 0; i < value.data.length; i++){
          setState(() {
            items += [CartItem(image: NetworkImage(Urls.imageBaseUrl + value.data[i]["image"].toString()), title: value.data[i]["title"].toString(), price: double.parse(value.data[i]["price"]), measureUnit: value.data[i]["unit"].toString(), id: value.data[i]["id"].toString(), quantity: int.parse(value.data[i]["quantity"]), productId: value.data[i]["product_id"].toString())];
            total += double.parse(value.data[i]["total_price"]);
          });
        }
      } else{
        setState(() {
          isLoading = false;
          isCartEmpty = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Color(0xFF81ae4f),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            title: Text("Cart"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white70,),
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 22,
            ),
          ),
        ),
        body: Stack(
          children: [
            items.length != 0
                ? Container(
              height: size.height,
              width: size.width,
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 80, left: 20, right: 20, top: 20),
                  physics: BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, int index){
                    return Slidable(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black45)
                        ),
                        child: ListTile(
                          leading: Image(image: items[index].image, height: 70, width: 60, fit: BoxFit.fill,),
                          title: Text(items[index].title),
                          subtitle: Text("\u20B9 ${(items[index].total = items[index].price * items[index].quantity)}", style: TextStyle(color: Colors.green),),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.black)
                          ),
                          trailing: Container(
                            width: 110,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: !items[index].remove ? (){
                                    if(items[index].id != null){
                                      setState(() {
                                        items[index].remove = true;
                                        if(items[index].quantity > 1)
                                          items[index].quantity -= 1;
                                      });
                                      FormData formData = FormData.fromMap({
                                        "cart_id" : items[index].id,
                                        "quantity" : items[index].quantity,
                                      });
                                      Services.updateQuantity(formData).then((value) {
                                        if(value.response == 1){
                                          setState(() {
                                            items[index].remove = false;
                                          });
                                          Fluttertoast.showToast(msg: value.message);
                                          Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                                        } else {
                                          setState(() {
                                            items[index].remove = false;
                                          });
                                        }
                                      });
                                    }
                                  } : null,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green,
                                    ),
                                    child: items[index].remove
                                        ? SizedBox(height: 17, width: 17, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white), strokeWidth: 1.5,),)
                                        : Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                                SizedBox(width: 2,),
                                Text(
                                  items[index].quantity.toString().padLeft(2, '0') +
                                      " " +
                                      items[index].measureUnit.toUpperCase(),
                                  style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                                ),
                                SizedBox(width: 2,),
                                InkWell(
                                  onTap: !items[index].add ? (){
                                    if(items[index].id != null){
                                      setState(() {
                                        items[index].add = true;
                                        items[index].quantity += 1;
                                      });
                                      FormData formData = FormData.fromMap({
                                        "cart_id" : items[index].id,
                                        "quantity" : items[index].quantity.toString(),
                                      });
                                      Services.updateQuantity(formData).then((value) {
                                        if(value.response == 1){
                                          setState(() {
                                            items[index].add = false;
                                          });
                                          Fluttertoast.showToast(msg: value.message);
                                          items.clear();
                                          getCartData();
                                        } else {
                                          setState(() {
                                            items[index].add = false;
                                          });
                                        }
                                      });
                                    }
                                  } : null,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    child: items[index].add
                                        ? SizedBox(height: 17, width: 17, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white), strokeWidth: 1.5,),)
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
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDesc(id: items[index].productId)));
                          },
                        ),
                      ),
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: [
                        Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(20))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.delete, color: Colors.white, size: 30,),
                              ],
                            ),
                            onPressed: (){
                              setState(() {
                                String cartId = items[index].id;
                                items.removeAt(index);
                                removeFromCart(cartId: cartId);
                              });
                            },
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  }
              ),
            )
                : Center(
              child: isLoading
                  ? SizedBox.shrink()
                  : Image(image: AssetImage("assets/images/empty-cart.png"), fit: BoxFit.fill, height: 200, width: 200,),
            ),
            Positioned(
              bottom: 10,
              child: button(
                  context: context,
                  onPressed: items.length != 0 ? placeOrder : null,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 2),
                    child: items.length != 0
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${items.length != 0 ? items.length : 0} ITEMS | \u20B9 " + total.toString().padRight(2, '0'),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        FlatButton(
                          child: Text("ORDER",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          onPressed: placeOrder,
                          color: Colors.white.withOpacity(0.3),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        )
                      ],
                    )
                    : !isCartEmpty ? SizedBox(height: 30, width: 30, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(colors[Random().nextInt(colors.length)]), strokeWidth: 1.5,)) : Text("Your cart is empty !!!", style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),)
                  ),
                  height: 60),
            )
          ],
        ));
  }

  void placeOrder(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrder(),));
  }

  void removeFromCart({@required String cartId}) {
    if(cartId != null){
      FormData formData = FormData.fromMap({
        "cart_id": cartId
      });
      Services.removeFromCart(formData).then((value) {
        if(value.response == 1){
          getCartData();
          Fluttertoast.showToast(msg: value.message);
          // Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        }
      });
    } else Fluttertoast.showToast(msg: "Something went wrong !!!");
  }

  void removeQuantity(cartId, quantity) {
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
  }

  void updateQuantity(cartId, quantity) {
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
  }
}

class CartItem{
  final ImageProvider image;
  final String measureUnit, id, title, productId;
  double price, total;
  int quantity;
  bool add = false, remove = false;
  CartItem({this.title, this.image, this.price, this.measureUnit, this.id, this.quantity, this.total, this.productId});
}