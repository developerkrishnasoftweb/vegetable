import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Item extends StatefulWidget {
  final List<AddItems> items;
  Item({@required this.items}) : assert(items.length != null);
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      // child: Scrollbar(
        child: GridView.builder(
          controller: scrollController,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 5,
              childAspectRatio: 1.05
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
                      child: Column(
                        children: [
                          RichText(
                            softWrap: true,
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: widget.items[index].name,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),
                                children: [
                                  WidgetSpan(child: Divider(color: Colors.transparent, height: 2,)),
                                  TextSpan(
                                    text: "\n" + widget.items[index].subName,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black54
                                    ),
                                  )
                                ]
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.items[index].price.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                      text: widget.items[index].rating + "\t",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),
                                      children: [
                                        WidgetSpan(
                                            child: Icon(Icons.star, color: Colors.white, size: 11,)
                                        )
                                      ]
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: (){},
              borderRadius: BorderRadius.circular(20),
            );
          },
          itemCount: widget.items.length,
          scrollDirection: Axis.horizontal,
        ),
        // controller: scrollController,
      // ),
    );
  }
}

class AddItems{
  final ImageProvider image;
  final String name, subName, rating, price;
  AddItems({this.image, this.name, this.subName, this.price, this.rating});
}
