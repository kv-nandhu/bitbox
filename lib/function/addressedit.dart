// ignore_for_file: non_constant_identifier_names

import 'package:bitebox/function/address_function.dart';
import 'package:bitebox/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> edit_address(int? id, String name, String contact, String address,
    String city, String pincode) async {
  final editBox = await Hive.openBox<Address>('address');
  final existingAddress =
      editBox.values.firstWhere((element) => element.id == id);
  existingAddress.usrname = name;
  existingAddress.number = contact;
  existingAddress.address = address;
  existingAddress.city = city;
  existingAddress.pincode = pincode;

  await editBox.put(id, existingAddress);
  getaddress();
}

// //delete address
void removeaddress(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove Address'),
          content: Text('Do you want to Delete'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  deleteaddress(context, id);
                },
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      });
}

Future<void> deleteaddress(context, int? id) async {
  final remove = await Hive.openBox<Address>('address');
  remove.delete(id);
  getaddress();
  Navigator.pop(context);
}