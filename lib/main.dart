import 'package:bitebox/dark_mode/theme.dart';
import 'package:bitebox/dark_mode/theme_provider.dart';
import 'package:bitebox/models/address_model.dart';
import 'package:bitebox/models/cart_model.dart';
import 'package:bitebox/models/user_favorite.dart';
import 'package:bitebox/comon_page/splash_screen.dart';
import 'package:bitebox/models/user_login.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:bitebox/order_cancel/cancel_model.dart';
import 'package:bitebox/orders_place/order_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
const SAVE_KEY = 'userLogin';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


    await Hive.initFlutter();
    Hive.openBox<Cart>('cart');
   
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(AddproductsAdapter().typeId)) {
    Hive.registerAdapter(AddproductsAdapter());
  }
  if (!Hive.isAdapterRegistered(AddfavoriteAdapter().typeId)) {
  Hive.registerAdapter(AddfavoriteAdapter());
}
if (!Hive.isAdapterRegistered(CartAdapter().typeId)) {
  Hive.registerAdapter(CartAdapter());
}
if (!Hive.isAdapterRegistered(AddressAdapter().typeId)) {
  Hive.registerAdapter(AddressAdapter());
}
if (!Hive.isAdapterRegistered(OredrplaceAdapter().typeId)) {
  Hive.registerAdapter(OredrplaceAdapter());
}
if (!Hive.isAdapterRegistered(CancelorderAdapter().typeId)) {
  Hive.registerAdapter(CancelorderAdapter());
}
  
  runApp(
     MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.fallback(),
      home: ScreenSplash(),
    );
  }
}