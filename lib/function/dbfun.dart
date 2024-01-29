
// ignore_for_file: camel_case_types

import 'package:bitebox/models/user_login.dart';
import 'package:bitebox/admin/admin_models/user_product.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Addproducts>> productlist = ValueNotifier([]);
String dbname = 'dbname';

ValueNotifier<List<User>> userslist = ValueNotifier([]);

class dbhelper {
    Future<void> delete(int id) async {
    final remove = await Hive.openBox<Addproducts>(dbname);
    remove.delete(id);
    getall();
  }

  Future<void> save(Addproducts value) async {
    final save = await Hive.openBox<Addproducts>(dbname);
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
      id,
      Addproducts(
        name: data!.name,
        // category: data.category,
        prize: data.prize,
        about: data.about,
        image: data.image,
        category: data.category,
        unit: data.unit,
        id: id,
      ),
    );
  
    
  }

  Future<void> getall() async {
    final save = await Hive.openBox<Addproducts>(dbname);
    productlist.value.clear();
    productlist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    productlist.notifyListeners();
  }
}
