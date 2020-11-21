import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vegetable/Pages/address_management/address.dart';
import '../../Components/appbar.dart';
import '../../Components/customButton.dart';
import 'cart.dart';
import 'payment.dart';

class PaymentMethod extends StatefulWidget {
  final String time, dateTime;
  final List<CartItem> items;
  final Addresses address;
  PaymentMethod({this.dateTime, this.time, @required this.items, @required this.address});
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  List<PaymentOptions> paymentOptionItems = [
    PaymentOptions(color: Colors.black, title: "Razor Pay", onTap: (){}, icon: "assets/icons/razorpay.png"),
    PaymentOptions(color: Colors.black, title: "Cash on Delivery", onTap: (){}, icon: "assets/icons/finance.png"),
    PaymentOptions(color: Colors.black, title: "Pickup Myself", onTap: (){}, icon: "assets/icons/shop.png"),
  ];

  String paymentMethod;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: appBar(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          title: "Payment Method",
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 22,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text("Payment Options :", style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 70, top: 30),
                    itemBuilder: (context, index){
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 5),
                        dense: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: (){
                          setState(() {
                            for(int i = 0; i < paymentOptionItems.length; i++)
                              paymentOptionItems[i].color = Colors.black;
                            paymentOptionItems[index].color = Colors.green;
                            paymentMethod = index.toString();
                          });
                        },
                        title: Align(alignment: index == 1 ? Alignment(-1.31, 0.0) : Alignment(-1.2, 0.0), child: Text(paymentOptionItems[index].title, style: Theme.of(context).textTheme.bodyText1.copyWith(color: paymentOptionItems[index].color.withOpacity(0.5), fontWeight: FontWeight.bold, fontSize: 17),),),
                        leading: ImageIcon(AssetImage(paymentOptionItems[index].icon), color: paymentOptionItems[index].color,),
                      );
                    },
                    itemCount: paymentOptionItems.length,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: button(
                context: context,
                onPressed: (){
                  if(paymentMethod == null)
                    Fluttertoast.showToast(msg: "Please select payment options");
                  else
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentConfirm(paymentMethod: paymentMethod, items: widget.items, address: widget.address)));
                },
                text: "PLACE ORDER",
                height: 60),
          )
        ],
      ),
    );
  }
}



class PaymentOptions{
  final String title, icon;
  final GestureTapCallback onTap;
  Color color;
  PaymentOptions({this.color, this.title, this.onTap, this.icon});
}
