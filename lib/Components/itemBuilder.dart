import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable/constant/colors.dart';
import 'package:vegetable/services/services.dart';

class AddItems{
  final ImageProvider image;
  final String title, price, displayPrice, id;
  final GestureTapCallback onTap;
  bool isPressed = false;
  AddItems({this.image, this.title, this.price, this.displayPrice, this.id, this.onTap});
}

class ItemBuilder extends StatefulWidget {
  final List<AddItems> items;
  final Axis scrollDirection;
  final int crossAxisCount;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  ItemBuilder({@required this.items, this.scrollDirection, this.crossAxisCount, this.childAspectRatio, this.mainAxisSpacing, this.crossAxisSpacing});
  @override
  _ItemBuilderState createState() => _ItemBuilderState();
}

class _ItemBuilderState extends State<ItemBuilder> {
  @override
  Widget build(BuildContext context) {
    if(widget.items.length != null){
      return GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount ?? 1,
            mainAxisSpacing: widget.mainAxisSpacing ?? 15,
            crossAxisSpacing: widget.crossAxisSpacing ?? 5,
            childAspectRatio: widget.childAspectRatio ?? 1.05
        ),
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black45)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: widget.items[index].image,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: widget.items[index].title.toString() + "\n",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colours.textColor
                              ),
                              children: [
                                TextSpan(
                                  text: "\u20B9" + widget.items[index].price.toString().padRight(2, '0') + "\t",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colours.primaryColor
                                  ),
                                ),
                                TextSpan(
                                  text: "\u20B9" + widget.items[index].displayPrice.toString().padRight(2, '0'),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colours.textLightColor,
                                      decoration: TextDecoration.lineThrough
                                  ),
                                )
                              ]
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: !widget.items[index].isPressed
                                ? () async {
                              setState(() {
                                widget.items[index].isPressed = true;
                              });
                              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                              String customerId;
                              customerId = sharedPreferences.getString("id");
                              if (customerId != null && widget.items[index].id != null) {
                                FormData formData = FormData.fromMap({
                                  "customer_id": customerId,
                                  "product_id": widget.items[index].id,
                                  "quantity": "1",
                                });
                                Services.addToCart(formData).then((value) {
                                  if (value.response == 1) {
                                    setState(() {
                                      widget.items[index].isPressed = false;
                                    });
                                    Fluttertoast.showToast(msg: value.message);
                                  } else{
                                    setState(() {
                                      widget.items[index].isPressed = false;
                                    });
                                    Fluttertoast.showToast(msg: value.message);
                                  }
                                });
                              } else {}
                            } : null,
                            color: Colours.primaryColor,
                            child: widget.items[index].isPressed
                                ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colours.primaryColor), strokeWidth: 1.5,),)
                                : Icon(Icons.add, color: Colours.textDarkColor,),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: widget.items[index].onTap,
            borderRadius: BorderRadius.circular(20),
          );
        },
        itemCount: widget.items.length != null ? widget.items.length : 0,
        scrollDirection: widget.scrollDirection ?? Axis.horizontal,
      );
    } else return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 0),);
  }
}
