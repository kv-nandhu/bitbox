import 'package:bitebox/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 176, 39, 39),
            Color.fromARGB(255, 0, 0, 0)
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Admin Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _usernameController,
                    maxLength: 20,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 254, 254),
                            width: 2,
                          )),
                      labelText: "user name",
                      hintText: "Enter Username",
                      prefixIcon: Icon(Icons.man),
                      suffixIcon: Icon(Icons.verified_user),
                      helperText: "Enter Username characters",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    maxLength: 4,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 2,
                            )),
                        labelText: "Password",
                        hintText: "Enter password",
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: Icon(Icons.verified_user),
                        helperText: "Atleast 4 characters "),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        onPrimary: Colors.black,
                      ),
                      onPressed: () {
                        checkLogin(context);
                      },
                      child: Text(
                        'Admin Login',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
          )),
    );
  }

  void checkLogin(BuildContext ctx) async {
    // ignore: unused_local_variable
    final _shared = await SharedPreferences.getInstance();
    await _shared.setBool(SAVE_KEY, true);
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == 'nandhu' && password == '1234') {
      // ignore: use_build_context_synchronously
      Navigator.push(ctx, MaterialPageRoute(builder: (context) => AdminHome()));
    } else {
      const errorMessage = 'Username or Password doesnot match';

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        content: Text(errorMessage),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
