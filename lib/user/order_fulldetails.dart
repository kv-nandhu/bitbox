// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';

class DetailsOrder extends StatefulWidget {
  final String name;
  final String price;
  final String details;
  final int count;
  final int total;
  final String addressname;
  final String address;
  final String contact;
  final String city;
  final String pincode;
  final String image;

  const DetailsOrder(
      {required this.name,
      required this.price,
      required this.details,
      required this.count,
      required this.total,
      required this.addressname,
      required this.address,
      required this.contact,
      required this.city,
      required this.pincode,
      required this.image,
      super.key});

  @override
  State<DetailsOrder> createState() => _DetailsOrderState();
}
class _DetailsOrderState extends State<DetailsOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
          title: Text(
            "Order Details",
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.count} item"),
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
                        Image.file(
                          File(widget.image),
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                              widget.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                           SizedBox(
                          height: 18,
                        ),
                          Text(
                          "₹${widget.total}",
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                           ],
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
                        // Text(
                        //   widget.name,
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.w600, fontSize: 17),
                        // ),
                        // SizedBox(
                        //   height: 18,
                        // ),
                        // Text(
                        //   "₹${widget.total}",
                        //   style: TextStyle(color: Colors.green, fontSize: 16),
                        // ),
                        SizedBox(
                          height: 18,
                        ),
                        Align(alignment: Alignment.bottomLeft,
                          child: Text(widget.details)),
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
                        Text("₹${widget.total}"),
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
                        "Name    : ${widget.addressname}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Contact  : ${widget.contact}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Address : ${widget.address}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "City         : ${widget.city}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Pincode : ${widget.pincode}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
