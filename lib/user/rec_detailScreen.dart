// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:bitebox/function/addcart_button.dart';
import 'package:bitebox/function/cartdbhelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/arc.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    required this.products,
    super.key,
  });
  dynamic products;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {
  carthHelper chelp = carthHelper();
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
        padding: EdgeInsets.only(top: 5, bottom: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 280,
              child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Image.file(File(widget.products.image!))),
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
                          padding: EdgeInsets.only(
                            top: 60,
                            bottom: 10,
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
                                 Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                // totalprice.toString(),
                                '₹${widget.products.prize}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          checkCart(widget.products, context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.shade700,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
