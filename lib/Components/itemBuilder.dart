import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

GridView itemBuilder({@required List<AddItems> items}){
  ScrollController scrollController = ScrollController();

  if(items != null){
    return GridView.builder(
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
                  image: items[index].image,
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
                            text: items[index].title.toString() + "\n",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: "\u20B9" + items[index].displayPrice.toString().padRight(2, '0') + "\t",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green
                                ),
                              ),
                              TextSpan(
                                text: "\u20B9" + items[index].price.toString().padRight(2, '0'),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black45,
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
                          onPressed: (){},
                          color: Colors.green,
                          child: Icon(Icons.add, color: Colors.white,),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: items[index].onTap,
          borderRadius: BorderRadius.circular(20),
        );
      },
      itemCount: items.length != null ? items.length : 0,
      scrollDirection: Axis.horizontal,
    );
  } else return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 0),);
}

/*class Item extends StatefulWidget {
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: widget.items[index].title.toString() + "\n",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),
                                children: [
                                  TextSpan(
                                    text: "\u20B9" + widget.items[index].displayPrice.toString().padRight(2, '0') + "\t",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\u20B9" + widget.items[index].price.toString().padRight(2, '0'),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black45,
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
                              onPressed: (){
                                setState(() {
                                });
                              },
                              color: Colors.green,
                              child: Icon(Icons.add, color: Colors.white,),),
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
          itemCount: widget.items.length ?? 0,
          scrollDirection: Axis.horizontal,
        ),
        // controller: scrollController,
      // ),
    );
  }
}*/

class AddItems{
  final ImageProvider image;
  final String title, price, displayPrice, id;
  final GestureTapCallback onTap;
  AddItems({this.image, this.title, this.price, this.displayPrice, this.id, this.onTap});
}
