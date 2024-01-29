import 'package:bitebox/user/orders_place/order_cancel.dart';
import 'package:bitebox/models/order_model.dart';
import 'package:bitebox/function/orderfunction.dart';
import 'package:bitebox/user/order_screens/order_fulldetails.dart';
import 'package:bitebox/custom/orderdetails_extract.dart';
import 'package:flutter/material.dart';

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                custom_order(orderdetail: orderdetail),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => DetailsOrderscreen(
                                                      name: orderdetail
                                                          .productName,
                                                      price: orderdetail
                                                          .productPrice,
                                                      details: orderdetail
                                                          .productabout,
                                                      total: orderdetail
                                                          .totalPrice,
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
                                                          status: orderdetail.status, 
                                                          date: orderdetail.date,
                                                          time: orderdetail.time.toString(),
                                                          
                                                    )));
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromARGB(
                                                      255, 12, 11, 11))),
                                      child: Text('Details')),
                                  ElevatedButton(
                                    onPressed: () {
                                    
                                      cancel(context, orderdetail.id, orderdetail);
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

