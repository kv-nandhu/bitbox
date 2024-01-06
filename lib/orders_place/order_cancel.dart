import 'package:bitebox/orders_place/order_model.dart';
import 'package:bitebox/orders_place/orderfunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void cancel(BuildContext context, int? id) {
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('Cancel order'),
      content: Text('Do you want to cancel'),
      actions: [
        ElevatedButton(onPressed: () {
          conformcancel(context, id);
        }, child: Text('Yes')),
        ElevatedButton(onPressed: () {}, child: Text('No'))
      ],
    );
  });
}

Future<void> conformcancel(context, int? id) async {
  final cancel = await Hive.openBox<Oredrplace>('order');
  cancel.delete(id);
  getorder();
  Navigator.pop(context);
}