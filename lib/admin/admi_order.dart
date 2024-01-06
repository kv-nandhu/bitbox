
import 'package:bitebox/user/order_detail.dart';
import 'package:bitebox/user/order_cncl.dart';
import 'package:flutter/material.dart';

class OrderMain extends StatefulWidget {
  const OrderMain({super.key});

  @override
  State<OrderMain> createState() => _OrderMainState();
}

class _OrderMainState extends State<OrderMain> {
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
