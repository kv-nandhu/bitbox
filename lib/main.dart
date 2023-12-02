import 'package:bitebox/models/user_favorite.dart';
import 'package:bitebox/user/splash_screen.dart';
import 'package:bitebox/models/user_login.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

// ignore: constant_identifier_names
const SAVE_KEY = 'userLogin';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
  
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(AddproductsAdapter().typeId)) {
    Hive.registerAdapter(AddproductsAdapter());
  }
  if (!Hive.isAdapterRegistered(AddfavoriteAdapter().typeId)) {
  Hive.registerAdapter(AddfavoriteAdapter());
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
