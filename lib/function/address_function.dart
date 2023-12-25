// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:bitebox/models/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';


ValueNotifier<List<Address>> addresslist = ValueNotifier([]);
Future<void> addtoaddress(Address value) async {
  final addressDB = await Hive.openBox<Address>('address');
  final id = await addressDB.add(value);
  final data = addressDB.get(id);

  await addressDB.put(
      id,
      Address(
          usrname: data!.usrname,
          number: data.number,
          address: data.address,
          city: data.city,
          pincode: data.pincode,
          id: id,));
  getaddress();
}

Future<void> getaddress() async {
  final addrsssDB = await Hive.openBox<Address>('address');
  addresslist.value.clear();
  addresslist.value.addAll(addrsssDB.values);
  addresslist.notifyListeners();
}