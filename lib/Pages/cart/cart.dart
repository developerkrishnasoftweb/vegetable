import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/Components/customButton.dart';
import 'package:vegetable/Pages/cart/place_order.dart';
import 'package:vegetable/services/services.dart';
import 'package:vegetable/services/urls.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  GlobalKey globalKey = GlobalKey();
  final List<CartItem> items = [
    CartItem(image: AssetImage("assets/productImages/tomato.png"), title: "Tomato", price: 45, measureUnit: "KG", id: "1", quantity: 1),
    CartItem(image: AssetImage("assets/productImages/Potatoes.png"), title: "Potato", price: 10, measureUnit: "LTR", id: "1", quantity: 5),
    CartItem(image: AssetImage("assets/productImages/onion.png"), title: "Onion", price: 100, measureUnit: "GR", id: "1", quantity: 10),
  ];
  double total = 0;

  @override
  void initState() {

    FormData formData = FormData.fromMap({
      "customer_id" : getCustomerId()
    });
    Services.viewCart(formData).then((value) {
      print(value.data);
    });
    super.initState();
  }
  Future<String> getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("id");
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
            Container(
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
                                  SizedBox(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          items[index].quantity > 1 ? items[index].quantity -= 1 : null;
                                          total = 0;
                                        });
                                        for(int i = 0; i < items.length; i++) {
                                          setState(() {
                                            total += items[i].price * items[i].quantity;
                                          });
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.green,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    items[index].quantity.toString().padLeft(2, '0') + " " + items[index].measureUnit,
                                    style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                  SizedBox(width: 5,),
                                  SizedBox(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          items[index].quantity += 1;
                                          total = 0;
                                        });
                                        for(int i = 0; i < items.length; i++) {
                                          setState(() {
                                            total += items[i].price * items[i].quantity;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        child: Icon(
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
                            ),
                            onTap: (){},
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
                                Icon(Icons.delete, color: Colors.white,),
                                Text("Delete", style: TextStyle(color: Colors.white),),
                              ],
                            ),
                            onPressed: (){
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),
            Positioned(
              bottom: 10,
              child: button(
                  context: context,
                  onPressed: placeOrder,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${items.length} ITEMS | \u20B9 " + total.toString().padRight(2, '0'),
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
                    ),
                  ),
                  height: 60),
            )
          ],
        ));
  }

  void placeOrder(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrder(),));
  }
}

class CartItem{
  final ImageProvider image;
  final String measureUnit, id, title;
  double price, total;
  int quantity;
  CartItem({this.title, this.image, this.price, this.measureUnit, this.id, this.quantity, this.total});
}