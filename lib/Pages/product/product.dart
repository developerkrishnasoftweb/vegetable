import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Components/appbar.dart';
import '../../Components/itemBuilder.dart';
import '../../Components/page_route.dart';
import '../../Pages/product_description/productDesc.dart';
import '../../services/services.dart';

class Products extends StatefulWidget {
  final String title;
  final String subCategoryId;
  Products({this.title, this.subCategoryId});
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<AddItems> _item1 = [AddItems(image: AssetImage("assets/images/loading.gif"), displayPrice: "00", price: "00", title: "----", id: null)];

  @override
  void initState() {
    if(widget.subCategoryId == null)
      getProducts();
    else
      getSubCategoryProducts();
    super.initState();
  }

  void getProducts() async {
    await Services.getProducts().then((value) {
      if(value.response == 1){
        for(int i = 0; i < value.data.length; i++){
          setState(() {
            _item1 += [AddItems(title: value.data[i]["title"], id: value.data[i]["id"], price: value.data[i]["price"], displayPrice: value.data[i]["display_price"], image: NetworkImage("http://vegetable.krishnasoftweb.com/" + value.data[i]["image"]), onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDesc(id: value.data[i]["id"],))); })];
          });
        }
      } else Fluttertoast.showToast(msg: value.message);
    });
    _item1.removeAt(0);
  }
  void getSubCategoryProducts() async {
    FormData body = FormData.fromMap({
      "sub_category_id" : widget.subCategoryId
    });
    await Services.getSubCategoryProducts(body).then((value) {
      if(value.response == 1){
        for(int i = 0; i < value.data.length; i++){
          setState(() {
            _item1 += [AddItems(title: value.data[i]["title"], id: value.data[i]["id"], price: value.data[i]["price"], displayPrice: value.data[i]["display_price"], image: NetworkImage("http://vegetable.krishnasoftweb.com/" + value.data[i]["image"]), onTap: (){ Navigator.push(context, CustomPageRoute(widget: ProductDesc(id: value.data[i]["id"],))); })];
          });
        }
      } else Fluttertoast.showToast(msg: value.message);
    });
    _item1.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: widget.title,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white70,
          ),
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
      body: Container(
        height: size.height,
        width: size.width,
        child: ItemBuilder(items: _item1, scrollDirection: Axis.vertical, crossAxisCount: 2, childAspectRatio: 1)
      ),
    );
  }
}
