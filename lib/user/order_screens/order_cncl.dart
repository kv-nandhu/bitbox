// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:bitebox/function/cancel_function.dart';
import 'package:bitebox/models/cancel_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

cancelHelper cncl = cancelHelper();

class CancelDetails extends StatefulWidget {
  const CancelDetails({super.key});

  @override
  State<CancelDetails> createState() => _CancelDetailsState();
}

class _CancelDetailsState extends State<CancelDetails> {
  @override
  void initState() {
    super.initState();
    cncl.getall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 17,
          ),
          ValueListenableBuilder(
              valueListenable: cancelorderlist,
              builder: (context, List<Cancelorder> cancel, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: cancel.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cancelitem = cancel.reversed.toList()[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        margin: EdgeInsets.all(10.0),
                        height: 120,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 75,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Image.file(
                                              File(cancelitem.image))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cancelitem.name,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '₹${cancelitem.price}',
                                            style: GoogleFonts.rubik(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Qty : ${cancelitem.productCount.toString()}',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'OrderCanceld',
                                        style: GoogleFonts.rubik(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 255, 5, 5)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
