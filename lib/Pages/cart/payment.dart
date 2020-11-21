import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:vegetable/Components/text_textrow.dart';
import '../../Components/page_route.dart';
import '../../Pages/address_management/address.dart';
import '../../Pages/home.dart';
import '../../services/services.dart';
import '../../Components/appbar.dart';
import '../../Components/customButton.dart';
import '../../Components/userdata.dart';
import 'cart.dart';

class PaymentConfirm extends StatefulWidget {
  final String paymentMethod;
  final List<CartItem> items;
  final Addresses address;
  PaymentConfirm({this.paymentMethod, @required this.items, @required this.address});

  @override
  _PaymentConfirmState createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends State<PaymentConfirm> {
  Razorpay _razorpay;
  List<CartItem> items = [];
  double total;
  double tax = 6;
  double grandTotal;
  double deliveryCharge = 25;
  double discount = 0;
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
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, paymentWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void paymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: response.paymentId);
  }
  void paymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: response.message);
  }
  void paymentWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "Something went wrong " + response.walletName);
  }

  void checkOut(){
    var options = {
      'key' : 'rzp_test_PwpFtLmDKvQqI7',
      'amount' : grandTotal * 100,
      'name' : UserData.firstName,
      'description' : 'Payment for products',
      'prefill' : {
        'contact' : UserData.mobile,
        'email' : UserData.email,
      },
      'external' : {
        'wallets' : ['paytm'],
      }
    };
    try{
      _razorpay.open(options);
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
          child: appBar(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            title: "Payment Confirm",
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
                    descList(title: "Total", amount: (total).toString(), context: context, showRupeeSymbol: "\u20B9"),
                    descList(title: "Delivery Charge", amount: (deliveryCharge).toString(), lead: "+", context: context, showRupeeSymbol: "\u20B9"),
                    descList(title: "Service Tax (${tax.toString()}%)", amount: taxAmount.toStringAsFixed(2), lead: "+", context: context, showRupeeSymbol: "\u20B9"),
                    descList(title: "Discount", amount: discount.toString(), lead: "-", context: context, showRupeeSymbol: "\u20B9"),
                    Divider(color: Colors.black, thickness: 2,),
                    descList(title: "Total Payable", amount: grandTotal.toStringAsFixed(2), context: context, showRupeeSymbol: "\u20B9"),
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


  void cashOnDelivery() {
    String productsId = "", quantity = "", price = "";
    for(int i = 0; i < widget.items.length; i++){
      setState(() {
        productsId += (widget.items[i].productId).toString() + (i < widget.items.length-1 ? "," : "").toString();
        quantity += (widget.items[i].quantity).toString() + (i < widget.items.length-1 ? "," : "").toString();
        price += (widget.items[i].price).toString() + (i < widget.items.length-1 ? "," : "").toString();
      });
    }
    FormData body = FormData.fromMap({
      "customer_id" : UserData.id,
      "name" : widget.address.name,
      "mobile" : widget.address.mobile,
      "email" : widget.address.email,
      "address1" : widget.address.address1,
      "address2" : widget.address.address2,
      "landmark" : widget.address.landmark,
      "area" : widget.address.area,
      "pincode" : widget.address.pinCode,
      "state" : widget.address.state,
      "city" : widget.address.city,
      "type" : widget.address.type,
      "total_price" : grandTotal,
      "order_type" : "Home Delivery",
      "payment_mode" : "COD",
      "payment_status" : "pending",
      "transaction_type" : "CASH",
      "reference_no" : "COD",
      "transaction_date" : DateFormat("yyyy-M-dd").format(DateTime.now()).toString(),
      "transaction_time" : DateFormat("HH:mm:s").format(DateTime.now()).toString(),
      "product_id" : productsId,
      "quantity" : quantity,
      "price" : price,
    });
    Services.addOrder(body).then((value) {
      if(value.response == 1){
        Navigator.pushAndRemoveUntil(context, CustomPageRoute(widget: Home()), (route) => false);
        Fluttertoast.showToast(msg: value.message);
      } else {
        Fluttertoast.showToast(msg: value.message);
      }
    });
  }
}
