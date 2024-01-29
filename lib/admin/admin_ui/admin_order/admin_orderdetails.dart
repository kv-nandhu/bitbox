// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';
import 'package:bitebox/user/order_screens/track.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../models/order_model.dart';

// ignore: camel_case_types
class adminDetials extends StatefulWidget {
  Oredrplace orderpd;
  // ignore: prefer_typing_uninitialized_variables
  final id;
  adminDetials({required this.id, required this.orderpd, super.key});
  @override
  State<adminDetials> createState() => _adminDetialsState();
}

// ignore: camel_case_types
class _adminDetialsState extends State<adminDetials> {
  int _productCategory = 0;
  File? imageSelect;
  List<int> categories = [
    0,
    1,
    2,
    3,
  ];
  List statusnames = ['order', 'shipped', 'outOfDelivery', 'delivered'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.redAccent.shade700,
          centerTitle: true,
          iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
          title: Text(
            "Order Details",
            style: TextStyle(color: Color.fromARGB(255, 255, 253, 253)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.orderpd.productCount} item"),
                  Row(
                    children: [
                      Icon(
                        Icons.receipt,
                        color: Color.fromARGB(255, 1, 69, 100),
                      ),
                      Text(
                        "RECEIPT",
                        style:
                            TextStyle(color: Color.fromARGB(255, 1, 69, 100)),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(),
                )),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 100,
                            child: Image.file(
                              File(widget.orderpd.productImage),
                              height: 70,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.orderpd.productName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 17),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                "₹${widget.orderpd.totalPrice}",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(widget.orderpd.productabout)),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delivery"),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          "Grand Total",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "₹50",
                          style: TextStyle(color: Colors.green),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text("₹${widget.orderpd.totalPrice}"),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CUSTOMER DETAILS",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name    : ${widget.orderpd.deliveryName}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Contact  : ${widget.orderpd.deliveryPhone}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Address : ${widget.orderpd.deliveryAddress}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "City         : ${widget.orderpd.deliveryCity}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),

                      Text("Pincode : ${widget.orderpd.pincode}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),

                  
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TrackScreen(val: widget.orderpd.status),
                                ));
                          },
                          child: Text('Track'))
                    ],
                  ),
                ],
              ),
              DropdownButtonFormField<String>(
                value: _productCategory.toString(),
                decoration: const InputDecoration(
                  fillColor: Color(0xABFFFEFE),
                  labelText: 'product category',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                items: categories.map((int category) {
                  return DropdownMenuItem<String>(
                    value: category.toString(),
                    child: Text(statusnames[category]),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _productCategory = int.parse(value!);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    _updateProduct();
                  },
                  child: Text('Update Track')),
                      SizedBox(height: 50,),
            ],
          ),
        ));
  }

  Future<void> _updateProduct() async {
    widget.orderpd.status = _productCategory;
    final updateBox = await Hive.openBox<Oredrplace>("order");
    await updateBox.put(widget.id, widget.orderpd);
  }
}
