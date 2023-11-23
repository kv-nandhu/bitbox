import 'package:bitebox/models/user_product.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


ValueNotifier<List<Addproducts>> productlist = ValueNotifier([]);

Future<void> addproduct(Addproducts value) async {
  final productDB = await Hive.openBox<Addproducts>('add_product');
  final _addproduct = await productDB.add(value);
  value.id = _addproduct;
  productlist.value.add(value);
  productlist.notifyListeners();
}

Future<void> getproducts() async {
  final productDB = await Hive.openBox<Addproducts>('add_product');
  productlist.value.clear();
  productlist.value.addAll(productDB.values);
  productlist.notifyListeners();
}



