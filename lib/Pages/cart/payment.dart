import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:vegetable/Components/customButton.dart';
import 'cart.dart';

class PaymentConfirm extends StatefulWidget {
  final String paymentMethod;
  final List<CartItem> items;
  PaymentConfirm({this.paymentMethod, @required this.items});

  @override
  _PaymentConfirmState createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends State<PaymentConfirm> {
  Razorpay razorPay;
  List<CartItem> items = [];
  double total;
  double tax = 6;
  double grandTotal;
  double deliveryCharge = 25;
  double discount = 50;
  double taxAmount;
  void getTotalAmount(){
    setState(() => total = 0);
    for(int i = 0; i < items.length; i++)
      setState(() => total += items[i].quantity * items[i].price);
  }
  void getGrandTotal(){
    taxAmount = (total * tax) / 100;
    setState(() {
      grandTotal = total + deliveryCharge + taxAmount - discount;
    });
  }

  @override
  void initState() {
    setState(() {
      items = widget.items;
    });
    super.initState();
    razorPay = Razorpay();
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentError);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, paymentWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorPay.clear();
  }

  void paymentSuccess(){
    print("Success");
  }
  void paymentError(){
    print("Error");
  }
  void paymentWallet(){
    print("Wallet");
  }

  void checkOut(){
    var options = {
      "key" : "rzp_test_PwpFtLmDKvQqI7",
      "amount" : grandTotal.toString(),
      "name" : "Gaurav",
      "description" : "Payment for products",
      "prefill" : {
        "contact" : "8758431418",
        "email" : "gaurav@gmail.com",
      },
      "external" : {
        "wallets" : ["paytm"],
      }
    };
    try{
      razorPay.open(options);
    }catch (e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getTotalAmount();
    getGrandTotal();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Color(0xFF81ae4f),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            title: Text("Payment Confirm"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white70,),
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
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Text("Item Details :", style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, int index){
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Image(image: items[index].image, height: 70, width: 60, fit: BoxFit.fill,),
                              title: Text(items[index].title),
                              subtitle: Text("${items[index].quantity} ${items[index].measureUnit} x \u20B9 ${items[index].price}", style: TextStyle(color: Colors.green),),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.black, style: BorderStyle.solid)
                              ),
                              onTap: (){},
                              trailing: Text("\u20B9 " + (items[index].quantity * items[index].price).toString(), style: TextStyle(color: Colors.green),),
                            ),
                          );
                        }
                    ),
                    SizedBox(height: 30,),
                    Text("Billing Details :", style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    descList(title: "Total", amount: (total).toString()),
                    descList(title: "Delivery Charge", amount: (deliveryCharge).toString(), lead: "+"),
                    descList(title: "Service Tax (${tax.toString()}%)", amount: taxAmount.toStringAsFixed(2), lead: "+"),
                    descList(title: "Discount", amount: discount.toString(), lead: "-"),
                    Divider(color: Colors.black, thickness: 2,),
                    descList(title: "Total Payable", amount: grandTotal.toStringAsFixed(2)),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: button(
                  context: context,
                  onPressed: (){
                    switch(widget.paymentMethod){
                      case "0":
                          checkOut();
                        break;
                      case "1":
                          cashOnDelivery();
                        break;
                      case "2":

                        break;
                      default:
                        print("Something went wrong");
                        break;
                    }
                  },
                  text: "PLACE ORDER",
                  height: 60),
            )
          ],
        ));
  }

  Widget descList({String title, String amount, String lead}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title + " :", style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),),
          Text((lead != null ? lead : "") + " \u20B9 " + amount, style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  void cashOnDelivery() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
  }
}
