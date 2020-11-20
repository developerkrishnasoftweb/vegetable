import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegetable/services/urls.dart';
import '../../Components/appbar.dart';
import '../../Pages/my_orders/my_orders.dart';

class OrderDesc extends StatefulWidget {
  final OrderDetail order;
  OrderDesc({this.order});
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDesc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context: context, title: "Order Detail"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.order != null
                ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.order.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                      leading: Image(
                        height: 40,
                        width: 40,
                        image: NetworkImage(Urls.imageBaseUrl +
                            widget.order.products[index]["image"]),
                        fit: BoxFit.fill,
                      ),
                      title: Text(widget.order.products[index]["title"], style: Theme.of(context).textTheme.bodyText1,),
                      children: [
                        Container(
                          height: 150,
                          width: size.width,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey[200], width: 1.5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                height: size.width * 0.25,
                                width: size.width * 0.25,
                                image: NetworkImage(Urls.imageBaseUrl +
                                    widget.order.products[index]["image"]),
                                fit: BoxFit.fill,
                              ),
                              Container(
                                height: 150,
                                width: size.width * 0.75 - 60,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.order.deliveryStatus,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.order.products[index]["title"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                        color: Colors.black54,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                    Text(
                                      "Rate this product",
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  })
                : Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                  strokeWidth: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
