// ignore_for_file: file_names

import 'package:bitebox/main.dart';
import 'package:bitebox/comon_page/first_screen.dart';
import 'package:bitebox/user/main_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoLogin(context);
    checkUserLoggin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD20E0E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              width: 350,
            ),
            Image.asset(
              'images/splash.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> gotoLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => SigninLogin()));
  }
  
  Future<void> checkUserLoggin() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedin = _sharedPrefs.getBool("saveUserEmail");
   print(_userLoggedin);
    if (_userLoggedin == null || _userLoggedin == false) {
      gotoLogin(context);
    } else {
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomesScreenPage()));
    }
  }
}
