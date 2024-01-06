// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:bitebox/order_cancel/cancel_function.dart';
import 'package:bitebox/order_cancel/cancel_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

cancelHelper cncl = cancelHelper();
class CancelUser extends StatefulWidget {
  const CancelUser({super.key});

  @override
  State<CancelUser> createState() => _CancelUserState();
}

class _CancelUserState extends State<CancelUser> {
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
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.file(File(
                                    cancelitem.image,
                                  )),
                                  height: 80,
                                  width: 120,
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      cancelitem.name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      cancelitem.about,
                                      style: GoogleFonts.rubik(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // SizedBox(
                                    //   height: 15,
                                    // ),
                                    // Text(
                                    //   qty[index],
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  width: 42,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'OrderCanceld',
                                      style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      '₹${cancelitem.price}',
                                      style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
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