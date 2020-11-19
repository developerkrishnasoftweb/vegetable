import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/appbar.dart';
import '../Components/page_route.dart';
import '../constant/colors.dart';
import '../Components/userdata.dart';
import '../Pages/badges/badge.dart';
import '../Pages/cart/cart.dart';
import '../Pages/product/product.dart';
import '../Pages/product_description/productDesc.dart';
import '../Pages/subcategory/subcategory.dart';
import '../services/services.dart';
import '../services/urls.dart';
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
  List<AddItems> _item1 = [
    AddItems(
        image: AssetImage("assets/images/loading.gif"),
        displayPrice: "00",
        price: "00",
        title: "----",
        id: null)
  ];
  List<AddItems> _item2 = [
    AddItems(
        image: AssetImage("assets/images/loading.gif"),
        displayPrice: "00",
        price: "00",
        title: "----",
        id: null)
  ];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int cartCount = 0;

  @override
  void initState() {
    getCategories();
    getBanners();
    getPopularProducts();
    getProducts();
    setUserData();
    super.initState();
  }
  String greeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "MORNING";
    }
    if (hour < 17) {
      return "AFTERNOON";
    }
    return "EVENING";
  }

  void getCategories() async {
    await Services.getAllCategory().then((value) {
      if (value.response == 1) {
        for (int i = 0; i < value.data.length; i++) {
          setState(() {
            foodGroceries += [
              CategoryItems(
                  image:
                      NetworkImage(Urls.imageBaseUrl + value.data[i]["image"]),
                  title: value.data[i]["title"],
                  id: value.data[i]["id"],
                  homeScreen: value.data[i]["home_screen"],
                  totalSubCategory: value.data[i]["total_sub_category"],
                  onTap: () {
                    if(int.parse(value.data[i]["total_sub_category"]) > 0){
                      Navigator.push(
                          context,
                          CustomPageRoute(widget: SubCategory(
                            productId: value.data[i]["id"],
                            title: value.data[i]["title"],
                          )));
                    }
                  })
            ];
          });
        }
      } else {
        Fluttertoast.showToast(msg: value.message);
      }
    });
  }

  void getBanners() async {
    await Services.getBanner().then((value) {
      if (value.response == 1) {
        for (int i = 0; i < value.data.length; i++) {
          setState(() {
            carousel += [
              CarouselItems(
                  image:
                      NetworkImage(Urls.imageBaseUrl + value.data[i]["image"]),
                  title: value.data[i]["title"],
                  category: value.data[i]["category"],
                  categoryId: value.data[i]["category_id"],
                  onTap: (){
                    Navigator.push(context, CustomPageRoute(widget: SubCategory(productId: value.data[i]["category_id"], title: value.data[i]["category"])));
                  })
            ];
          });
        }
      }
    });
  }

  void getPopularProducts() async {
    await Services.getPopularProducts().then((value) {
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
      }
    });
    _item1.removeAt(0);
  }

  void getProducts() async {
    await Services.getProducts().then((value) {
      if (value.response == 1) {
        for (int i = 0; i < value.data.length; i++) {
          setState(() {
            _item2 += [
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
      }
    });
    _item2.removeAt(0);
  }

  void setUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userData = jsonDecode(sharedPreferences.getString("userData"));
    setState(() {
      UserData.firstName = userData[0]["first_name"];
      UserData.lastName = userData[0]["last_name"];
      UserData.email = userData[0]["email"];
      UserData.mobile = userData[0]["mobile"];
      UserData.gender = userData[0]["gender"];
      UserData.image = userData[0]["image"];
      UserData.id = userData[0]["id"];
    });
  }

  @override
  Widget build(BuildContext context) {
    getCartCount();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: SafeArea(
        child: drawer(context: context, scaffoldKey: scaffoldKey),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height > 500 ? size.height * 0.3 : 180,
            width: size.width,
            decoration: BoxDecoration(
              color: Colours.primaryColor,
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
                  child: appBar(
                    context: context,
                    leading: IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/icons/menu-hamburger.png"),
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        scaffoldKey.currentState.openDrawer();
                      },
                      iconSize: 22,
                    ),
                    actions: [
                      badge(
                        context: context,
                        iconButton: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/icons/bell.png"),
                              color: Colors.white70,
                            ),
                            onPressed: () {
                            }),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CustomPageRoute(widget: Cart()));
                            }),
                        badgeValue: cartCount,
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
                      Text(
                        "GOOD ${greeting()}",
                        softWrap: true,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Hey, ${UserData.firstName != null ? UserData.firstName : ""}",
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Carousel(
                  height: size.height > 500 ? null : 150,
                  items: carousel,
                  width: size.width * 0.92,
                  borderRadius: BorderRadius.circular(20),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        buildTitledRow(
                            context: context,
                            onPressed: () {},
                            title: "Food & Groceries",
                            buttonTitle: "SEE ALL"),
                        Container(
                          width: size.width,
                          child: categoryBuilder(items: foodGroceries),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        buildTitledRow(
                            context: context,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CustomPageRoute(widget: Products(
                                            title: "Popular Products",
                                          )));
                            },
                            title: "Popular Products",
                            buttonTitle: "SEE ALL"),
                        Container(
                          child: _item1.length != 0 ? ItemBuilder(items: _item1) : SizedBox.shrink(),
                          height: 200,
                          width: size.width,
                        ),
                        buildTitledRow(
                            context: context,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CustomPageRoute(widget: Products(
                                            title: "Regular Products",
                                          )));
                            },
                            title: "Regular Products",
                            buttonTitle: "SEE ALL"),
                        Container(
                          child: _item2.length != 0 ? ItemBuilder(items: _item2) : SizedBox.shrink(),
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
}

Widget buildTitledRow(
    {@required BuildContext context,
    String title,
    String buttonTitle,
    @required VoidCallback onPressed}) {
  return ListTile(
    contentPadding: EdgeInsets.only(left: 20, right: 2),
    onTap: null,
    title: Text(
      title ?? "",
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
    ),
    trailing: FlatButton(
      child: Text(
        buttonTitle ?? "",
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.black45, fontSize: 14),
      ),
      onPressed: onPressed,
    ),
  );
}
