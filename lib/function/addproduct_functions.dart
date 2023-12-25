import 'package:bitebox/models/user_favorite.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';




ValueNotifier<List<Addfavorite>>addfavlist = ValueNotifier([]);

Future<void> addtofav(Addfavorite value) async {
  final addfavDB = await Hive.openBox<Addfavorite>('add_fav');
  final _addfav = await addfavDB.add(value);
  value.id = _addfav;
  addfavlist.value.add(value);
  addfavlist.notifyListeners();
}

Future<void> getfavorite() async {
  final addfavbox = await Hive.openBox<Addfavorite>('add_fav');
  addfavlist.value.clear();
  addfavlist.value.addAll(addfavbox.values);
  addfavlist.notifyListeners();
}



