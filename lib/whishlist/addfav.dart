
import 'package:bitebox/function/addproduct_functions.dart';
import 'package:bitebox/models/user_favorite.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: non_constant_identifier_names
void addfav_button(Addproducts addproducts, BuildContext context) async {
  await Hive.openBox<Addfavorite>('add_fav');
  final addfavBox = Hive.box<Addfavorite>('add_fav');

  final favexists =
      addfavBox.values.any((user) => user.name == addproducts.name);
  if (favexists) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Already Exist!'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  } else {
    final fav = Addfavorite(
      name: addproducts.name,
      prize: addproducts.prize,
      about: addproducts.about,
      image: addproducts.image,
      category: addproducts.category,
      id: -1,
    );
    addtofav(fav);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added to Favorite'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.green,
    ));
  }
}

void removefav(BuildContext context, int? id) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text('Remove Favorite'),
      content: Text('Do you want remove'),
      actions: [
        ElevatedButton(onPressed: () {
          deletefav(context, id!);
        }, child: Text('yes')),
        ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('No'))
      ],
    );
  });
}

void deletefav(context, int id) async {
  final remove = await Hive.openBox<Addfavorite>('add_fav');
  remove.delete(id);
  getfavorite();

  Navigator.pop(context);
}

// Future <Icon> getIcon(addproducts) async {
//   await Hive.openBox<Addfavorite>('add_fav');
//   final addfavBox = Hive.box<Addfavorite>('add_fav');
//   final favexists =
//       addfavBox.values.any((user) => user.name == addproducts.name);

//   if (favexists) {
//     return Icon(
//       Icons.favorite,
//       color: Colors.red,
//     );
//   } else {
//     return Icon(
//       Icons.favorite_border,
//       color: Colors.black,
//     );
//   }
// }
Icon getIcon(addproducts) {
  final addfavBox = Hive.box<Addfavorite>('add_fav');
  final favexists =
      addfavBox.values.any((user) => user.name == addproducts.name);

  if (favexists) {
    return Icon(
      Icons.favorite,
      color: Colors.red,
    );
  } else {
    return Icon(
      Icons.favorite_border,
      color: Colors.black,
    );
  }
}