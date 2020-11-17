import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Pages/address_management/address_mgt.dart';
import '../../services/services.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  List<Addresses> addressList = [];
  int selectedAddress = 1;

  @override
  void initState() {
    myAddresses();
    super.initState();
  }

  void myAddresses() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FormData formData = FormData.fromMap(
        {"customer_id": sharedPreferences.getString("id").toString()});
    Services.myAddresses(formData).then((value) {
      if (value.response == 1) {
        for (int i = 0; i < value.data.length; i++) {
          if(i == 0){
            setState(() {
              selectedAddress = int.parse(value.data[i]["id"]);
            });
          }
          setState(() {
            addressList += [
              Addresses(
                  customerId: value.data[i]["customer_id"].toString(),
                  id: value.data[i]["id"].toString(),
                  name: value.data[i]["name"].toString(),
                  type: value.data[i]["type"].toString(),
                  address1: value.data[i]["address1"].toString(),
                  address2: value.data[i]["address2"].toString(),
                  area: value.data[i]["area"].toString(),
                  city: value.data[i]["city"].toString(),
                  email: value.data[i]["email"].toString(),
                  landmark: value.data[i]["landmark"].toString(),
                  mobile: value.data[i]["mobile"].toString(),
                  pinCode: value.data[i]["pincode"].toString(),
                  state: value.data[i]["state"].toString()),
            ];
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF81ae4f),
        title: Text(
          "My Address",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAddress()));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            splashRadius: 25,
          ),
        ],
      ),
      body: addressList.length != 0
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAddress(address: addressList[index])));
                  },
                  child: Container(
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
                        Radio(
                            value: int.parse(addressList[index].id),
                            groupValue: selectedAddress,
                            onChanged: (value) {
                              setState(() {
                                selectedAddress = value;
                              });
                            }),
                        Container(
                          height: 150,
                          width: size.width - 100,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                addressList[index].name != "null" ? addressList[index].name : "N/A",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                addressList[index].address1 != "null" ? addressList[index].address1 : "N/A",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                addressList[index].mobile != "null" ? addressList[index].mobile : "N/A",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Colors.black54,
                                      fontSize: 13
                                    ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: addressList.length,
            )
          : Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                  strokeWidth: 1.3,
                ),
              ),
            ),
    );
  }
}

class Addresses {
  final String customerId,
      name,
      email,
      mobile,
      address1,
      address2,
      landmark,
      area,
      pinCode,
      state,
      city,
      id,
      type;
  bool isSelected = false;
  Addresses(
      {this.email,
      this.mobile,
      this.customerId,
      this.name,
      this.type,
      this.address1,
      this.address2,
      this.area,
      this.city,
      this.landmark,
      this.pinCode,
      this.id,
      this.isSelected,
      this.state});
}