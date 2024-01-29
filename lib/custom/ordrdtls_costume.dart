// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:bitebox/user/order_screens/order_fulldetails.dart';
import 'package:flutter/material.dart';

class orderfulldetails extends StatelessWidget {
  const orderfulldetails({
    super.key,
    required this.widget,
  });

  final DetailsOrderscreen widget;

  @override
  Widget build(BuildContext context) {
   
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
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
           Text(
  "₹${widget.total * widget.count + 50}",
  style: TextStyle(
    fontSize: 14,  // You can adjust the font size as needed
    fontWeight: FontWeight.bold,
  ),
),

              SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
class countandreceipt extends StatelessWidget {
  const countandreceipt({
    super.key,
    required this.widget,
  });

  final DetailsOrderscreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${widget.count} item"),
        Row(
          children: const [
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
    );
  }
}
class cliprect extends StatelessWidget {
  const cliprect({
    super.key,
    required this.widget,
  });

  final DetailsOrderscreen widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 100,
        child: Image.file(
          File(widget.image),
          height: 70,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}