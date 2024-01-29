// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_import, prefer_const_constructors_in_immutables, annotate_overrides, sized_box_for_whitespace, duplicate_ignore

import 'dart:io';

import 'package:bitebox/function/addcart_button.dart';
import 'package:bitebox/function/cartdbhelper.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/models/cart_model.dart';
import 'package:bitebox/user/address/address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../admin/admin_models/user_product.dart';

carthHelper chelp = carthHelper();
dbhelper dbh = dbhelper();
late double totals;

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Box<Cart> cartBox = Hive.box<Cart>('cart');
  late Box<Addproducts> pdBox = Hive.box<Addproducts>('dbname');
  final int total = 0;

  @override
  void initState() {
    super.initState();
    chelp.getall();
    dbh.getall();
  }

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    var total = 0;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.redAccent.shade700,
          title: Text(
            "Cart",
            style: GoogleFonts.rubik(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: cartBox.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/cartempty.jpg',
                    height: 350,
                  ),
                  Text(
                    "Your Cart is Currently Empty❗",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 400,
                      child: ValueListenableBuilder(
                          valueListenable: addcartlist,
                          builder:
                              (context, List<Cart> addcartlist, Widget? child) {
                            return ListView.builder(
                                itemCount: addcartlist.isEmpty
                                    ? 1
                                    : addcartlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final cart =
                                      addcartlist.reversed.toList()[index];

                                  int price = int.parse(cart.prize!);
                                  int? quantity = cart.count;
                                  int totalPrice = price * quantity!;

                                  total += totalPrice;

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 10,
                                        left: 10),
                                    child: Slidable(
                                      startActionPane: ActionPane(
                                          motion: StretchMotion(),
                                          children: [
                                            SlidableAction(
                                              label: 'Remove',
                                              onPressed: (context) {
                                                setState(() {
                                                  // delete_cart(cart.id);
                                                  removecart(context, cart.id);
                                                });
                                              },
                                              icon: Icons.delete,
                                              autoClose: true,
                                              backgroundColor: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )
                                          ]),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    child: Container(
                                                      width: 80,
                                                      height: 100,
                                                      child: Image.file(
                                                        File(cart.image!),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          cart.name!,
                                                          style:
                                                              GoogleFonts.rubik(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text('₹${cart.prize!}'),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 124,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 67, 130, 178),
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Column(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              if (cart.count! <
                                                                  int.parse(cart
                                                                      .unit!)) {
                                                                cart.count =
                                                                    (cart.count! +
                                                                            1)
                                                                        .clamp(
                                                                            0,
                                                                            9);
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        SnackBar(
                                                                  content: Text(
                                                                      'Max Limit'),
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                ));
                                                              }
                                                            });
                                                          },
                                                          icon: Icon(
                                                            CupertinoIcons.add,
                                                          ),
                                                          iconSize: 20,
                                                        ),
                                                        Text('${cart.count}'),
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              if (cart.count! >
                                                                  1) {
                                                                cart.count =
                                                                    (cart.count! -
                                                                            1)
                                                                        .clamp(
                                                                            0,
                                                                            9);
                                                              }
                                                            });
                                                          },
                                                          icon: Icon(
                                                              CupertinoIcons
                                                                  .minus),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        width: double.infinity,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: ValueListenableBuilder<Box<Cart>>(
                          valueListenable: cartBox.listenable(),
                          builder: (context, cartBox, _) {
                            return Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sub-Total",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '₹${total.toString()}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Delivery",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          "₹50",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          "₹${total+50}", // Assuming total is the correct variable
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                          onPressed: () {
                            if (cartBox.isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ViewAddress(
                                            total: total,
                                          )));
                            } else {
                              Navigator.pop(context);
                              showDailogealert(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            primary: Colors.redAccent.shade700,
                          ),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  void showDailogealert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Cart was Empty',
          ),
          content: Text('You need to add a Product '),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }
}
