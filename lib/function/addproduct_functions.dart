// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bitebox/models/user_favorite.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<Addfavorite>> addfavlist = ValueNotifier([]);

Future<void> addtofav(Addfavorite value) async {
  final addfavDB = await Hive.openBox<Addfavorite>('add_fav');
  final id = await addfavDB.add(value);
  final favadata = addfavDB.get(id);
  await addfavDB.put(
      id,
      Addfavorite(
          name: favadata!.name,
          prize: favadata.prize,
          image: favadata.image,
          about: favadata.about,
          category: favadata.category,
          id: id));
  // value.id = _addfav;
  // addfavlist.value.add(value);
  // addfavlist.notifyListeners();
  getfavorite();
}

Future<void> getfavorite() async {
  final addfavbox = await Hive.openBox<Addfavorite>('add_fav');
  addfavlist.value.clear();
  addfavlist.value.addAll(addfavbox.values);
  // ignore: invalid_use_of_protected_member
  addfavlist.notifyListeners();
}
