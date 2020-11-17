import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vegetable/Components/categoryBuilder.dart';
import 'package:vegetable/services/services.dart';

class SubCategory extends StatefulWidget {
  final String productId;
  SubCategory({@required this.productId});

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<CategoryItems> categories = [];
  bool hasData = false;
  bool found = false;

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  void getCategories() async {
    FormData formData = FormData.fromMap({"category_id": widget.productId});
    await Services.getSubCategory(formData).then((value) {
      if (value.response == 1) {
        setState(() => hasData = true);
        for (int i = 0; i < value.data.length; i++) {
          setState(() {
            categories += [
              CategoryItems(
                  image: NetworkImage("http://vegetable.krishnasoftweb.com/" +
                      value.data[i]["image"]),
                  title: value.data[i]["title"],
                  id: value.data[i]["id"],
                  homeScreen: value.data[i]["home_screen"],
                  onTap: () {},
                  categoryId: value.data[i]["category_id"])
            ];
          });
        }
      } else {
        Fluttertoast.showToast(msg: value.message);
        setState(() => found = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Color(0xFF81ae4f),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            title: Text("Hey, Lorem"),
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
              IconButton(
                  icon: ImageIcon(
                    AssetImage("assets/icons/shopping-cart.png"),
                    color: Colors.white70,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
        body: hasData
            ? Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 20, right: 2),
                    onTap: () {},
                    title: Text(
                      "Food & Groceries",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    trailing: FlatButton(
                      child: Text(
                        "SEE ALL",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.black45, fontSize: 14),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: categoryBuilder(items: categories),
                    ),
                  )
                ],
              )
            : Center(
                child: found
                    ? Image(
                        height: 250,
                        width: 300,
                        image: AssetImage("assets/images/empty-cart.png"),
                        fit: BoxFit.fill,
                      )
                    // : CircularProgressIndicator(
                    //     valueColor: AlwaysStoppedAnimation(Colors.green),
                    //   )
                    : Image(
                        image: AssetImage("assets/images/loading.gif"),
                        fit: BoxFit.fill,
                      )));
  }
}
