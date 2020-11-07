import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vegetable/Components/customButton.dart';
import 'package:vegetable/services/urls.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  GlobalKey globalKey = GlobalKey();
  final List<CartItem> items = [
    CartItem(image: AssetImage("assets/productImages/tomato.png"), title: "Tomato", price: 45, measureUnit: "KG", id: "1", unit: 1),
    CartItem(image: AssetImage("assets/productImages/Potatoes.png"), title: "Potato", price: 10, measureUnit: "LTR", id: "1", unit: 5),
    CartItem(image: AssetImage("assets/productImages/onion.png"), title: "Onion", price: 100, measureUnit: "GR", id: "1", unit: 10),
  ];
  double total = 0;

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
                    /*return Dismissible(
                      key: new Key(items[index]),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Image(image: AssetImage("assets/productImages/tomato.png"), height: 70, width: 60, fit: BoxFit.fill,),
                          title: Text("Vegetable"),
                          subtitle: Text("\u20B9 45.00", style: TextStyle(color: Colors.green),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.black, style: BorderStyle.solid)
                          ),
                          onTap: (){},
                        ),
                      ),
                      onDismissed: (dismiss){
                        setState(() {
                          items.removeAt(index);
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("${items[index].toString()} " + "removed successfully !!"),));
                        });
                      },
                    );*/
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
                            subtitle: Text("\u20B9 ${(items[index].total = items[index].price * items[index].unit)}", style: TextStyle(color: Colors.green),),
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
                                      onTap: () { setState(() => items[index].unit > 1 ? items[index].unit -= 1 : null);
                                        for(int i = 0; i < items.length; i++)
                                          total = total - items[i].total - items[i].price;
                                        print(total);
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
                                    items[index].unit.toString().padLeft(2, '0') + " " + items[index].measureUnit,
                                    style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                  SizedBox(width: 5,),
                                  SizedBox(
                                    child: InkWell(
                                      onTap: () => setState(() {
                                        for(int i = 0; i < items.length; i++)
                                          total = total + items[i].total + items[i].price;
                                        print(total);
                                        items[index].unit += 1;
                                      }),
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
    print("Order Placed Successfully !!!");
  }
}

class CartItem{
  final ImageProvider image;
  final String measureUnit, id, title;
  double price, total;
  int unit;
  CartItem({this.title, this.image, this.price, this.measureUnit, this.id, this.unit, this.total});
}