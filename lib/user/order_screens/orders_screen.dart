// ignore: file_names
import 'package:bitebox/user/order_screens/order_detail.dart';
import 'package:bitebox/user/order_screens/order_cncl.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  icon() => null;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent.shade700,
          title: Text("My Orders"),
          centerTitle: true,
          bottom: TabBar(tabs: const [
            Tab(child: Text('Order')),
            Tab(child: Text('Cancel'))
          ]),
          
        ),
        body: TabBarView(
              children: const [
                 OrdersScreen(),
                CancelDetails(), 
              ],)
      
      ),
    );
  }
}
