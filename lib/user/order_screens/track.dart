// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

class TrackScreen extends StatefulWidget {
   TrackScreen({Key? key,required this.val}) : super(key: key);
  int? val;

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {


  List<List<TextDto>> statusLists = [
    [
      TextDto("Your order has been placed" ,null),
      TextDto("Seller has processed your order",null),
      TextDto("Your item has been picked up by courier partner.",null),
    ],
    [
      TextDto("Your order has been shipped", null),
      TextDto("Your item has been received in the nearest hub to you.", null),
    ],
    [
      TextDto("Your order is out for delivery", null),
    ],
    [
      TextDto("Your order has been delivered", null),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Tracker"),
        centerTitle: true,
        backgroundColor: Colors.redAccent.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            OrderTracker(
              key: ValueKey<int>(widget.val!),
              status: Status.values[widget.val!],
              activeColor: Colors.green,
              inActiveColor: Colors.grey[300],
              orderTitleAndDateList: statusLists[0],
              shippedTitleAndDateList: statusLists[1],
              outOfDeliveryTitleAndDateList: statusLists[2],
              deliveredTitleAndDateList: statusLists[3],
            ),
            SizedBox(height: 50,),
          
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: TrackScreen(),
//     ),
//   );
// }
