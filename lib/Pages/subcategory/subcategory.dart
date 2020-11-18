import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegetable/Pages/product/product.dart';
import '../../Components/categoryBuilder.dart';
import '../../Components/userdata.dart';
import '../../constant/colors.dart';
import '../../services/services.dart';

class SubCategory extends StatefulWidget {
  final String productId, title;
  SubCategory({@required this.productId, @required this.title});

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<CategoryItems> categories = [];
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
        for (int i = 0; i < value.data.length; i++) {
          setState(() {
            categories += [
              CategoryItems(
                  image: NetworkImage("http://vegetable.krishnasoftweb.com/" +
                      value.data[i]["image"]),
                  title: value.data[i]["title"],
                  id: value.data[i]["id"],
                  homeScreen: value.data[i]["home_screen"],
                  categoryId: value.data[i]["category_id"],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Products(title: value.data[i]["title"].toString(), subCategoryId: value.data[i]["id"].toString(),)));
                  })
            ];
          });
        }
      } else setState(() => found = true);
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
            title: Text("Hey, " + UserData.firstName),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 22,
            ),
            // actions: [
            //   IconButton(
            //       icon: ImageIcon(
            //         AssetImage("assets/icons/shopping-cart.png"),
            //         color: Colors.white70,
            //       ),
            //       onPressed: () {}),
            // ],
          ),
        ),
        body: categories.length != 0
            ? Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 20, right: 2),
                    title: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 20, fontWeight: FontWeight.normal),
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
                    : SizedBox(height: 30, width: 30, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colours.primaryColor), strokeWidth: 1.5,),)));
  }
}
