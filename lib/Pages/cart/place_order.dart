import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vegetable/Components/customButton.dart';
import 'package:vegetable/Components/textinput.dart';
import 'package:vegetable/Pages/cart/payment_method.dart';

class PlaceOrder extends StatefulWidget {

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  Color selectedColor = Colors.black54;
  List<DeliverBy> deliverDates = [
    DeliverBy(date: "9:00 AM - 10:30 AM", color: Colors.black54),
    DeliverBy(date: "9:00 AM - 10:30 AM", color: Colors.black54),
    DeliverBy(date: "9:00 AM - 10:30 AM", color: Colors.black54),
    DeliverBy(date: "9:00 AM - 10:30 AM", color: Colors.black54),
    DeliverBy(date: "9:00 AM - 10:30 AM", color: Colors.black54),
    DeliverBy(date: "9:00 AM - 10:30 AM", color: Colors.black54),
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Color(0xFF81ae4f),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          title: Text("Place Order"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white70,),
            onPressed: () {
              Navigator.pop(context);
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
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                input(
                    labelStyle: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    text: "Select Date :",
                    padding: EdgeInsets.zero,
                    readOnly: true,
                    context: context,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.black45)),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: DateFormat.yMMMd().format(selectedDate).toString(),
                        suffixIcon: IconButton(icon: ImageIcon(AssetImage("assets/icons/calendar.png"),), onPressed: (){_selectDate(context);},)
                    ),
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(
                      color: Colors.black45,
                    )
                ),
                SizedBox(height: 30,),
                Text("Delivery By :", style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                Expanded(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, bottom: 70),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                    ),
                    itemBuilder: (context, index){
                      return item(deliverDates[index]);
                    },
                    itemCount: deliverDates.length,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethod()));
                },
                text: "CONTINUE",
                height: 60),
          )
        ],
      ),
    );
  }
  Widget item(DeliverBy item) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: (){
        for(int i = 0; i < deliverDates.length; i++)
          setState(() => deliverDates[i].color = Colors.black54);
        setState(() {
          item.color = Colors.green;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: item.color),
          color: Colors.transparent
        ),
        child: Text(item.date, style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14, color: item.color, fontWeight: FontWeight.bold),),
      ),
    );
  }
}

class DeliverBy{
  final String date;
  Color color;
  DeliverBy({this.date, this.color});
}