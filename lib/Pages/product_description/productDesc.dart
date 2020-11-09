import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vegetable/Components/customButton.dart';
import 'package:vegetable/Components/itemBuilder.dart';
import 'package:vegetable/Pages/cart/cart.dart';
import 'package:vegetable/services/services.dart';
import 'package:vegetable/services/urls.dart';

class ProductDesc extends StatefulWidget {
  final String id;
  final List productDetail;
  ProductDesc({@required this.id, this.productDetail});

  @override
  _ProductDescState createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  int unit = 1;
  String measure = "--";
  List<AddItems> _item1 = [AddItems(image: AssetImage("assets/images/loading.gif"), displayPrice: "00", price: "00", title: "----", id: null)];
  ImageProvider imageProvider;
  String price = "0", shortInfo = "----", longInfo = "----", id;

  @override
  void initState() {
    getProducts();
    getProductData();
    super.initState();
  }

  void getProducts() async {
    await Services.getProducts().then((value) {
      if(value.response == 1){
        for(int i = 0; i < value.data.length; i++){
          setState(() {
            _item1 += [AddItems(title: value.data[i]["title"], id: value.data[i]["id"], price: value.data[i]["price"], displayPrice: value.data[i]["display_price"], image: NetworkImage(Urls.imageBaseUrl + value.data[i]["image"]), onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDesc(id: value.data[i]["id"],))); })];
          });
        }
      } else Fluttertoast.showToast(msg: value.message);
    });
    _item1.removeAt(0);
  }

  void getProductData() async {
    FormData formData = FormData.fromMap({
      "product_id" : widget.id,
    });
    await Services.getProduct(formData).then((value) {
      if(value.response == 1){
        setState(() {
          imageProvider = NetworkImage(Urls.imageBaseUrl + value.data[0]["image"]);
          price = value.data[0]["display_price"];
          measure = value.data[0]["unit"];
          shortInfo = value.data[0]["short_info"];
          longInfo = value.data[0]["long_info"];
          id = value.data[0]["id"];
        });
      } else Fluttertoast.showToast(msg: value.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 22,
        ),
        actions: [
          IconButton(
              icon: ImageIcon(
                AssetImage("assets/icons/shopping-cart.png"),
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 70, left: 20, right: 20),
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
                              spreadRadius: -3,
                              offset: Offset(-2, -2))
                        ]),
                    child: imageProvider == null ? SizedBox(height: 50, width: 50, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.green), strokeWidth: 2,),) : Image(height: (size.width * 0.7) - 10, width: size.width - 10, image: imageProvider, fit: BoxFit.fill,)
                  ),
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
                                onTap: () => setState(() => unit > 1 ? unit -= 1 : null),
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 30,
                                  width: 35,
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
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              unit.toString().padLeft(2, '0') + " " + measure,
                              style:
                              TextStyle(fontSize: 17, color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              child: InkWell(
                                onTap: () => setState(() => unit += 1),
                                child: Container(
                                  height: 30,
                                  width: 35,
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
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text("Description :",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(longInfo,
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text("Related Products",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: itemBuilder(items: _item1),
                    height: 200,
                    width: size.width,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: button(
                context: context,
                onPressed: () {

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                },
                text: "CONTINUE SHOPPING",
                height: 60),
          )
        ],
      ),
    );
  }
}
