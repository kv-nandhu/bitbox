// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:bitebox/orderspeges/order_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<Oredrplace>> orderlist = ValueNotifier([]);

Future<void> addtoorder(Oredrplace value) async {
  final addorderBox = await Hive.openBox<Oredrplace>('order');
  final id = await addorderBox.add(value);
  final data = addorderBox.get(id);
  print(id);
  await addorderBox.put(
      id,
      Oredrplace(
          id: id,
          productName: data!.productName,
          productPrice: data.productPrice,
          productDetails: data.productDetails,
          productImage: data.productImage,
          totalPrice: data.totalPrice,
          productCount: data.productCount,
          deliveryName: data.deliveryName,
          deliveryPhone: data.deliveryPhone,
          deliveryAddress: data.deliveryAddress,
          deliveryCity: data.deliveryCity,
          pincode: data.pincode));
  getorder();
}

Future<void> getorder() async {
  final orderDb = await Hive.openBox<Oredrplace>('order');
  orderlist.value.clear();
  orderlist.value.addAll(orderDb.values);
  orderlist.notifyListeners();
}