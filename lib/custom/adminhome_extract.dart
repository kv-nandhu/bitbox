// ignore_for_file: camel_case_types

import 'package:bitebox/admin/admin_ui/admin_order/admi_order.dart';
import 'package:bitebox/admin/admin_ui/admin_product/admin_product.dart';
import 'package:flutter/material.dart';

class adminhomeorderdeteail extends StatelessWidget {
  const adminhomeorderdeteail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 0, 0, 0)),
      // clipBehavior: Clip.antiAlias,
      child: ListTile(
        title: Text(
          'Orders Details',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderMain()));
        },
      ),
    );
  }
}
class adminhomeadditems extends StatelessWidget {
  const adminhomeadditems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 0, 0, 0)),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        title: Text(
          'Add Items',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => AddProductPage()));
        },
      ),
    );
  }
}
