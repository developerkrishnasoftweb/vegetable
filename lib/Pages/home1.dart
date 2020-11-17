import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Components/carousel.dart';
import '../Components/drawer.dart';
import '../Components/categoryBuilder.dart';
import '../Components/itemBuilder.dart';

class HomeSecond extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeSecond> {
  List<CarouselItems> carousel = [
    CarouselItems(image: AssetImage("assets/images/Banner-1.jpg")),
    CarouselItems(image: AssetImage("assets/images/Banner-2.jpg")),
    CarouselItems(image: AssetImage("assets/images/Banner-1.jpg")),
  ];

  List<CategoryItems> foodGroceries = [
    CategoryItems(image: AssetImage("assets/icons/fruits.png"), title: "Fruits"),
    CategoryItems(image: AssetImage("assets/icons/vegetable.png"), title: "Vegetable"),
    CategoryItems(image: AssetImage("assets/icons/orange-juice.png"), title: "Juice"),
    CategoryItems(image: AssetImage("assets/icons/soft-drink.png"), title: "Drinks"),
    CategoryItems(image: AssetImage("assets/icons/breakfast.png"), title: "Food & Meals"),
    CategoryItems(image: AssetImage("assets/icons/cake.png"), title: "Cake"),
  ];

  List<AddItems> _item1 = [
    AddItems(
      image: AssetImage("assets/productImages/Cauliflower.png"),
      title: "Fresh Tomatoes",
      price: "23",
      displayPrice: "20",
      id: "1",),
    AddItems(
      image: AssetImage("assets/productImages/Garlic.png"),
      title: "Fresh Tomatoes",
      price: "23",
      displayPrice: "20",
      id: "1",),
    AddItems(
      image: AssetImage("assets/productImages/lady finger.png"),
      title: "Fresh Tomatoes",
      price: "23",
      displayPrice: "20",
      id: "1",),
    AddItems(
      image: AssetImage("assets/productImages/onion.png"),
      title: "Fresh Tomatoes",
      price: "23",
      displayPrice: "20",
      id: "1",),
    AddItems(
      image: AssetImage("assets/productImages/Potatoes.png"),
      title: "Fresh Tomatoes",
      price: "23",
      displayPrice: "20",
      id: "1",),
    AddItems(
      image: AssetImage("assets/productImages/tomato.png"),
      title: "Fresh Tomatoes",
      price: "23",
      displayPrice: "20",
      id: "1",),
  ];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      drawer: drawer(scaffoldKey: scaffoldKey, context: context),
      body: Stack(
        children: [
          CustomScrollView(
            // physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Color(0xff81AE4F),
                collapsedHeight: 60,
                elevation: 0,
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
                flexibleSpace: FlexibleSpaceBar(
                  // titlePadding: EdgeInsets.only(left: 20),
                  centerTitle: true,
                  title: RichText(
                    text: TextSpan(
                        text: "GOOD MORNING\n",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12),
                        children: [
                          TextSpan(
                              text: "Hey, Lorem",
                              style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)
                          )
                        ]
                    ),
                  ),
                ),
                expandedHeight: size.height * 0.2,
                leading: IconButton(
                  icon: ImageIcon(AssetImage("assets/icons/menu-hamburger.png")),
                  onPressed: (){},
                  iconSize: 22,
                ),
                actions: [
                  IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/icons/bell.png"),
                        color: Colors.white70,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/icons/shopping-cart.png"),
                        color: Colors.white70,
                      ),
                      onPressed: () {}),
                ],
                onStretchTrigger: (){
                  print("Hello");
                  return;
                },
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Stack(
                        children: [
                          Container(
                            height: size.height * 0.1,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                              color: Color(0xff81AE4F),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.05,
                            child: Container(
                              height: size.height * 0.1,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                                color: Color(0xff81AE4F),
                              ),
                            ),
                          ),
                          Container(
                            height: size.height,
                            width: size.width,
                            // padding: EdgeInsets.only(top: size.height * 0.25),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
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
                                      onPressed: (){},
                                    ),
                                  ),
                                  ItemBuilder(items: _item1),
                                  // Item(items: _item1)
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ]
                ),
              )
            ],
          ),
          /*Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.only(top: size.height * 0.25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                      onPressed: (){},
                    ),
                  ),
                  Item(items: _item1)
                ],
              ),
            ),
          )*/
        ],
      )
    );
  }
}
