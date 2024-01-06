// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:bitebox/function/addcart_button.dart';
import 'package:bitebox/function/cartdbhelper.dart';
import 'package:bitebox/models/cart_model.dart';
import 'package:bitebox/orders_place/order_model.dart';
import 'package:bitebox/orders_place/orderfunction.dart';

import 'package:bitebox/orders_place/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

carthHelper chelp = carthHelper();
class PaymentScreen extends StatefulWidget {
  final dynamic address;
  final int total;
  const PaymentScreen({required this.address, required this.total, Key? key})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}
class _PaymentScreenState extends State<PaymentScreen> {
  int total = 0;
  @override
  void initState() {
    super.initState();
    chelp.getall();
    setState(() {});
  }

  dynamic cartgl;
  dynamic lengthcart;

  @override
  Widget build(BuildContext context) {
    //total = 0;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
          backgroundColor: Colors.redAccent.shade700,
        title: Text(
          'Confirm Order',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        //  mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 15, top: 10, bottom: 12),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Delivery Address',
                      style: GoogleFonts.rubik(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name     : ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.address.usrname}',
                              style: GoogleFonts.rubik(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone    : ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.address.number,
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address : ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.address.address,
                              style: GoogleFonts.rubik(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: addcartlist,
              builder: (context, List<Cart> cartadd, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: cartadd.length,
                      itemBuilder: (BuildContext context, int index) {
                        lengthcart = cartadd.length;
                        final cart = cartadd.reversed.toList()[index];
                        cartgl = cart;
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 7, right: 20, left: 20, top: 7),
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Adjust as needed
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Container(
                                      width: 92,
                                      height: 100,
                                      child: Image.file(
                                        File(cartgl.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      cart.name!,
                                      style: GoogleFonts.rubik(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('₹${cart.prize}',
                                        style: GoogleFonts.rubik(
                                            color: Colors.green, fontSize: 15)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            removecart(context, cart.id);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                    SizedBox(
                                      width: 1,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }),
          Padding(
              padding: const EdgeInsets.only(
                  left: 20, bottom: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      width: 280,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Only Accepted in Cash on Delivery')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        //color: Color.fromARGB(255, 221, 177, 56),
                        borderRadius: BorderRadius.circular(20)),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Total Price : ${widget.total}'),
                        SizedBox(
                          width: 75,
                        ),
                        SizedBox(
                          width: 150,
                          child: ValueListenableBuilder(
                              valueListenable: addcartlist,
                              builder: (BuildContext context,
                                  List<Cart> cartlist, Widget? child) {
                                return ElevatedButton(
                                    onPressed: () async {
                                      final cartBox =
                                          await Hive.openBox<Cart>(
                                              'cart');
                                      for (var i = 0;
                                          i < cartBox.length;
                                          i++) {
                                        final data = cartlist[i];
                                        final order = Oredrplace(
                                            id: data.id,
                                            productName: data.name!,
                                            productPrice: data.prize!,
                                            productabout: data.about!,
                                            productImage: data.image!,
                                            totalPrice: int.parse(
                                                data.prize!), //ith mattanam
                                            productCount: data.count!,
                                            deliveryName: widget.address.usrname,
                                            deliveryPhone:
                                                widget.address.number,
                                            deliveryAddress:
                                                widget.address.address,
                                            deliveryCity: widget.address.city,
                                            pincode: widget.address.pincode);
                                        addtoorder(order);
                                        cartBox.clear();
                                       chelp.getall();
                          
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => CnfrmPage()),
                                            (route) => false);
                                      }
                                    },style: ElevatedButton.styleFrom(
                                      primary: Colors.black
                                    ),
                                    child: Text('Place Order'));
                              }),
                        ),
                        SizedBox(
                          width: 1,
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
