// ignore: file_names
import 'dart:io';

import 'package:bitebox/function/addcart_button.dart';
import 'package:bitebox/user/address_screen.dart';
import 'package:bitebox/user/payment_page.dart';
import 'package:bitebox/user/cart.dart';
import 'package:bitebox/orderspeges/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/arc.dart';
import '../models/user_product.dart';

class DetailScreen extends StatefulWidget {
  
   DetailScreen({required this.products,super.key,});
      Addproducts products;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
    int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  icon() => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Container(
              height: 280,
              child: Padding(
                padding: EdgeInsets.all(7),
                child:Image.file(File(widget.products.image!))
              ),
            ),
            Arc(
                edge: Edge.TOP,
                arcType: ArcType.CONVEY,
                height: 50,
                child: Container(
                  
                  height: 400,
                  width: double.infinity,
                  color: Color.fromARGB(255, 213, 211, 211),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 60, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Text(
                                   '₹${widget.products.prize}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                               '${widget.products.name}',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // SizedBox(
                              //   width: 150,
                              // ),
                              Row(
                                
                                children: [
                                  Container(
                                    width: 120,
                                    height: 40,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    
                                        IconButton(onPressed: () {
                                          setState(() {
                                            decrementQuantity();
                                          });
                                        },
                                        icon: Icon(CupertinoIcons.minus)),
                                         Text(
                                              quantity.toString(),
                                              style: const TextStyle(
                                               fontSize: 15, color: Colors.white),
                                                 ),
                                                 
                                              IconButton(onPressed: () {
                                          setState(() {
                                         incrementQuantity();
                                          });
                                        },
                                        icon: Icon(CupertinoIcons.plus)),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                '${widget.products.about}',
                                style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Delivery Time",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Icon(
                                      CupertinoIcons.clock,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(
                                    "30 Minutes",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    // height: 50,
                    // width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                      setState(() {
                        checkCart(widget.products, context);
                      });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent.shade700,
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      // height: 50,
                      // width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewAddress(total: int.parse(widget.products.prize!),)));
                        },
                        style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: Colors.redAccent.shade700,
                        ),
                        child: Text(
                          'Buy',
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
            
          ],
        ),
      ),
    );
  }
}