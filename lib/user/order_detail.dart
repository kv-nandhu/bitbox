import 'dart:io';
import 'package:bitebox/order_cancel/cancel_button.dart';
import 'package:bitebox/orders_place/order_cancel.dart';
import 'package:bitebox/orders_place/order_model.dart';
import 'package:bitebox/orders_place/orderfunction.dart';
import 'package:bitebox/user/order_fulldetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    getorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 17,
          ),
          ValueListenableBuilder(
              valueListenable: orderlist,
              builder: (context, List<Oredrplace> order, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: order.length,
                    itemBuilder: (BuildContext context, int index) {
                      final orderdetail = order.reversed.toList()[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        margin: EdgeInsets.all(10.0),
                        height: 160,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.start, //lastupdate
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 75,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.file(
                                        File(orderdetail.productImage))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                                             
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          //  crossAxisAlignment: CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            orderdetail.productName,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        
                                          SizedBox(width: 110,),
                                           Text(
                                                 '₹${orderdetail.totalPrice.toString()}',
                                                 style: GoogleFonts.rubik(
                                                     fontSize: 14,
                                                     fontWeight: FontWeight.w500),
                                               )
                                            
                                        ],
                                      ),
                                      
                                           Row(
                                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,                                        
                                             children: [
                                              Text(
                                               'Qty : ${orderdetail.productCount.toString()}',
                                             ),
                                             SizedBox(width: 120,),  
                                              Text(
                                              'OrderPlaced',
                                              style: GoogleFonts.rubik(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            ),
                                             ],
                                           )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => DetailsOrder(
                                                      name:
                                                          orderdetail.productName,
                                                      price: orderdetail
                                                          .productPrice,
                                                      details: orderdetail
                                                          .productabout,
                                                      total:
                                                          orderdetail.totalPrice,
                                                      addressname: orderdetail
                                                          .deliveryName,
                                                      address: orderdetail
                                                          .deliveryAddress,
                                                      contact: orderdetail
                                                          .deliveryPhone,
                                                      count: orderdetail
                                                          .productCount,
                                                      city: orderdetail
                                                          .deliveryCity,
                                                      pincode:
                                                          orderdetail.pincode,
                                                      image: orderdetail
                                                          .productImage,
                                                    )));
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromARGB(
                                                      255, 12, 11, 11))),
                                      child: Text('Details')),
                                  SizedBox(
                                    width: 40,
                                  ),
                                                       ElevatedButton(
                                    onPressed: () {
                                      cancelbutton(orderdetail, context);
                                      cancel(context, orderdetail.id);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 191, 0, 255))),
                                    child: Text('Cancel'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
