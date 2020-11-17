import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/textinput.dart';
import '../../Pages/address_management/address.dart';
import '../../services/services.dart';

class ManageAddress extends StatefulWidget {
  final Addresses address;
  ManageAddress({this.address});
  @override
  _ManageAddressState createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController mobileController;
  TextEditingController add1Controller;
  TextEditingController add2Controller;
  TextEditingController landmarkController;
  TextEditingController areaController;
  TextEditingController pinCodeController;
  TextEditingController stateController;
  TextEditingController cityController;
  String name, email, mobile, add1, add2, landmark, area, pinCode, state, city;
  bool delete = false, update = false;
  String addressType = "address type";

  @override
  void initState() {
    if (widget.address != null) {
      nameController = TextEditingController(
          text: name =
              widget.address.name != "null" ? widget.address.name : null);
      emailController = TextEditingController(
          text: email =
              widget.address.email != "null" ? widget.address.email : null);
      mobileController = TextEditingController(
          text: mobile =
              widget.address.mobile != "null" ? widget.address.mobile : null);
      add1Controller = TextEditingController(
          text: add1 = widget.address.address1 != "null"
              ? widget.address.address1
              : null);
      add2Controller = TextEditingController(
          text: add2 = widget.address.address2 != "null"
              ? widget.address.address2
              : null);
      landmarkController = TextEditingController(
          text: landmark = widget.address.landmark != "null"
              ? widget.address.landmark
              : null);
      areaController = TextEditingController(
          text: area =
              widget.address.area != "null" ? widget.address.area : null);
      pinCodeController = TextEditingController(
          text: pinCode =
              widget.address.pinCode != "null" ? widget.address.pinCode : null);
      stateController = TextEditingController(
          text: state =
              widget.address.state != "null" ? widget.address.state : null);
      cityController = TextEditingController(
          text: city =
              widget.address.city != "null" ? widget.address.city : null);
      if (widget.address.type != "null") {
        setState(() {
          addressType = widget.address.type.toLowerCase();
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Edit Address",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
              splashRadius: 20,
              onPressed: update ? null : save,
              padding: EdgeInsets.zero,
              icon: update
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 1,
                      ),
                    )
                  : Icon(
                      Icons.check,
                      color: Colors.white,
                    )),
          IconButton(
              splashRadius: 20,
              padding: EdgeInsets.zero,
              onPressed: widget.address != null
                  ? delete ? null : deleteAddress
                  : () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Address()));
                    },
              icon: widget.address != null
                  ? delete
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            strokeWidth: 1,
                          ),
                        )
                      : Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                        )
                  : Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
        ],
        backgroundColor: Color(0xFF81ae4f),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            input(
                controller: nameController,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "Name",
                ),
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                }),
            input(
                controller: emailController,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "Email",
                ),
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                }),
            input(
                controller: mobileController,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "Mobile",
                ),
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    mobile = value;
                  });
                }),
            input(
                controller: add1Controller,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "Address 1",
                ),
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    add1 = value;
                  });
                }),
            input(
                controller: add2Controller,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "Address 2",
                ),
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    add2 = value;
                  });
                }),
            input(
                controller: landmarkController,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "Landmark",
                ),
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    landmark = value;
                  });
                }),
            input(
                controller: areaController,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "Area",
                ),
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    area = value;
                  });
                }),
            input(
                controller: pinCodeController,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "Pincode",
                ),
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    pinCode = value;
                  });
                }),
            input(
                controller: stateController,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "State",
                ),
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    state = value;
                  });
                }),
            input(
                controller: cityController,
                context: context,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  contentPadding: EdgeInsets.zero,
                  labelText: "City",
                ),
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                }),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: DropdownButton(
                  isExpanded: true,
                  value: addressType,
                  items: ["Address Type", "Home", "Office"].map((value) {
                    return DropdownMenuItem(
                      child: Text(
                        value,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.black),
                      ),
                      value: value.toLowerCase(),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      addressType = value;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void save() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      update = true;
    });
    if ("" != name &&
        "" != email &&
        "" != mobile &&
        "" != add1 &&
        "" != add2 &&
        "" != landmark &&
        "" != area &&
        "" != pinCode &&
        "" != state &&
        "" != city &&
        null != name &&
        null != email &&
        null != mobile &&
        null != add1 &&
        null != add2 &&
        null != landmark &&
        null != area &&
        null != pinCode &&
        null != state &&
        null != city) {
      if (addressType != "address type") {
        FormData formData = FormData.fromMap({
          "address_id": widget.address != null ? widget.address.id : "",
          "customer_id": sharedPreferences.getString("id"),
          "name": name,
          "email": email,
          "mobile": mobile,
          "address1": add1,
          "address2": add2,
          "landmark": landmark,
          "area": area,
          "pincode": pinCode,
          "state": state,
          "city": city,
          "type": addressType,
        });
        if(widget.address != null){
          Services.updateAddress(formData).then((value) {
            if (value.response == 1) {
              setState(() {
                update = false;
              });
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Address()));
            } else {
              Fluttertoast.showToast(msg: value.message);
              setState(() => update = false);
            }
          });
        } else {
          Services.addAddress(formData).then((value) {
            if (value.response == 1) {
              setState(() {
                update = false;
              });
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Address()));
            } else {
              Fluttertoast.showToast(msg: value.message);
              setState(() => update = false);
            }
          });
        }
      } else {
        setState(() => update = false);
        Fluttertoast.showToast(msg: "Please select address type");
      }
    } else {
      setState(() => update = false);
      Fluttertoast.showToast(msg: "Fields can't be empty");
    }
  }

  void deleteAddress() {
    setState(() {
      delete = true;
    });
    FormData formData = FormData.fromMap({"address_id": widget.address.id});
    Services.deleteAddress(formData).then((value) {
      if (value.response == 1) {
        setState(() {
          delete = false;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => Address()));
      } else {
        Fluttertoast.showToast(msg: value.message);
        setState(() {
          delete = false;
        });
      }
    });
  }
}
