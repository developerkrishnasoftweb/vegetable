import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/Pages/badges/badge.dart';
import 'package:vegetable/Pages/cart/cart.dart';
import 'package:vegetable/Pages/product/product.dart';
import 'package:vegetable/Pages/product_description/productDesc.dart';
import 'package:vegetable/Pages/subcategory/subcategory.dart';
import 'package:vegetable/services/services.dart';
import 'package:vegetable/services/urls.dart';
import '../Components/carousel.dart';
import '../Components/drawer.dart';
import '../Components/categoryBuilder.dart';
import '../Components/itemBuilder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CarouselItems> carousel = [];
  List<CategoryItems> foodGroceries = [];
  List userdata = [];
  List<AddItems> _item1 = [AddItems(image: AssetImage("assets/images/loading.gif"), displayPrice: "00", price: "00", title: "----", id: null)];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getCategories();
    getBanners();
    getProducts();
    getUserData();
    super.initState();
  }
  String greeting(){
    int hour = DateTime.now().hour;
    if(hour < 12){
      return "MORNING";
    }
    if(hour < 17){
      return "AFTERNOON";
    }
    return "EVENING";
  }

  void getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userdata = jsonDecode(sharedPreferences.getString("userData"));
    });
  }

  void getCategories() async {
    await Services.getAllCategory().then((value) {
      if(value.response == 1){
        for(int i = 0; i < value.data.length; i++){
          setState(() {
            foodGroceries += [CategoryItems(image: NetworkImage(Urls.imageBaseUrl + value.data[i]["image"]), title: value.data[i]["title"], id: value.data[i]["id"], homeScreen: value.data[i]["home_screen"], onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(productId: value.data[i]["id"],)));})];
          });
        }
      } else Fluttertoast.showToast(msg: value.message);
    });
  }

  void getBanners() async {
    await Services.getBanner().then((value) {
      if(value.response == 1){
        for(int i = 0; i < value.data.length; i++){
          setState(() {
            carousel += [CarouselItems(image: NetworkImage(Urls.imageBaseUrl + value.data[i]["image"]), title: value.data[i]["title"], category: value.data[i]["category_id"])];
          });
        }
      } else Fluttertoast.showToast(msg: value.message);
    });
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: scaffoldKey,
      drawer: SafeArea(child: drawer(context),),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.3,
            width: size.width,
            decoration: BoxDecoration(
              color: Color(0xFF81ae4f),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                        icon: ImageIcon(
                          AssetImage("assets/icons/menu-hamburger.png"),
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          scaffoldKey.currentState.openDrawer();
                        },
                        iconSize: 22,),
                    actions: [
                      badge(
                        context: context,
                        iconButton: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/icons/bell.png"),
                              color: Colors.white70,
                            ),
                            onPressed: () {}),
                        badgeValue: 0,
                        badgeColor: Colors.green,
                        badgeSize: Size(15, 15),
                      ),
                      badge(
                        context: context,
                        iconButton: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/icons/shopping-cart.png"),
                              color: Colors.white70,
                            ),
                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));}),
                        badgeValue: Badges.getCartCount(customerId: Badges.customerId()),
                        badgeColor: Colors.green,
                        badgeSize: Size(15, 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("GOOD ${greeting()}",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15),
                      ),
                      SizedBox(height: 5,),
                      Text("Hey, ${userdata.length != 0 ? userdata[0]["first_name"] : ""}",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                // Carousel(items: carousel, width: size.width * 0.92, borderRadius: BorderRadius.circular(20),),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Carousel(items: carousel, width: size.width * 0.92, borderRadius: BorderRadius.circular(20),),
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 20, right: 2),
                          onTap: (){},
                          title: Text("Food & Groceries",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          trailing: FlatButton(
                            child: Text("SEE ALL",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black45, fontSize: 14),
                            ),
                            onPressed: (){},
                          ),
                        ),
                        Container(
                          width: size.width,
                          child: categoryBuilder(items: foodGroceries),
                        ),
                        SizedBox(height: 30,),
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 20, right: 2),
                          onTap: (){},
                          title: Text("Want to shop for",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          trailing: FlatButton(
                            child: Text("SEE ALL",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black45, fontSize: 14),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Products(title: "Want to shop for",)));
                            },
                          ),
                        ),
                        Container(
                          child: ItemBuilder(items: _item1),
                          height: 200,
                          width: size.width,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
