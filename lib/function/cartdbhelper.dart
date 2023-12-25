import 'package:bitebox/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Cart>> addcartlist = ValueNotifier([]);

class carthHelper { 
  Future<void> delete(int id,) async {
    final remove = await Hive.openBox<Cart>('cart');
    remove.delete(id);
    getall();
  }

  Future<void> save(Cart value) async {
    final save = await Hive.openBox<Cart>('cart');
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
      id,
      Cart(
        name: data!.name,
        category: data.category,
        prize: data.prize,
        image: data.image,
        about: data.about,
         count: data.count,
        id: id, 
       
      ),
    );
    getall();
  }

  Future<void> getall() async {
    final save = await Hive.openBox<Cart>('cart');
    addcartlist.value.clear();
    addcartlist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    addcartlist.notifyListeners();
  }

  Future<void> upgradecart(id, Cart value) async {
    final updateBox = await Hive.openBox<Cart>('cart');
    if (updateBox.containsKey(id)) {
      await updateBox.put(id, value);
      int index = addcartlist.value.indexWhere((element) => element.id == id);
      if (index != -1) {
        addcartlist.value[index] = value;
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        addcartlist.notifyListeners();
      }
    }
    value.id = id;
    await updateBox.put(id, value);
  }
}