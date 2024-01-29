// ignore_for_file: use_build_context_synchronously, unnecessary_import

import 'package:bitebox/models/cart_model.dart';
import 'package:bitebox/user/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';



void checkCart( addproducts, BuildContext context) async {
await Hive.openBox<Cart>('cart');
  

  final cartBox = Hive.box<Cart>('cart');

  final carExists = cartBox.values.any((user) => user.name == addproducts.name);
  if (carExists) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Alredy Exist!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  } else {
    final cart = Cart(
        name: addproducts.name,
        prize: addproducts.prize,
        about: addproducts.about,
        image: addproducts.image,
         category: addproducts.category,
         unit: addproducts.unit,
        count: 1,
        id: -1,);
    chelp.save(cart);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Add In Cart Succesfully'),
      backgroundColor: Colors.green,
    ));
  }
}
//delete_cart_button

void removecart(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove cart'),
          content: Text('Do you want to remove'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  delete(context, id);
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
Future<void> delete(context, int? id) async {
  final remove = await Hive.openBox<Cart>('cart');
  remove.delete(id);
  chelp.getall();
  Navigator.of(context).pop(
    MaterialPageRoute(builder: (context) => CartScreen()),
  );
}


//count functions