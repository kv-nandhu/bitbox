// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bitebox/custom/ordrdtls_costume.dart';
import 'package:bitebox/user/order_screens/track.dart';
import 'package:flutter/material.dart';

class DetailsOrderscreen extends StatefulWidget {
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
  final int? status;
  final String date;
  final String time;
  const DetailsOrderscreen(
      {
        required this.status,
        required this.name,
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
       required this.date,
       required this.time,
      super.key});
  @override
  State<DetailsOrderscreen> createState() => _DetailsOrderscreenState();
}

class _DetailsOrderscreenState extends State<DetailsOrderscreen> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                countandreceipt(widget: widget),
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
                          cliprect(widget: widget),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
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
                orderfulldetails(widget: widget),
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
                    // SizedBox(
                    //   height: 50,
                    // )
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
                                 SizedBox(
                          height: 10,
                        ),
                                 Text("Date : ${widget.date}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                                 SizedBox(
                          height: 10,
                        ),
                                 Text("Time : ${widget.time}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
          
                                SizedBox(height: 50,),
                                ElevatedButton(onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder:(context) => TrackScreen(val: widget.status), ));
                                }, child: Text('Track'))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}






