import 'package:bitebox/admin/admin_ui/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  final _formKey = GlobalKey<FormState>();
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
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 188, 187, 187)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Admin Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(255, 33, 31, 31),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    maxLength: 20,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username is required';
                      }
                      // You can add more validation logic if needed
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 254, 254),
                          width: 2,
                        ),
                      ),
                      labelText: "Username",
                      hintText: "Enter Username",
                      prefixIcon: Icon(Icons.man),
                      suffixIcon: Icon(Icons.verified_user),
                      helperText: "Enter Username characters",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    maxLength: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 4) {
                        return 'Password must be at least 4 characters';
                      }
                      // You can add more validation logic if needed
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2,
                        ),
                      ),
                      labelText: "Password",
                      hintText: "Enter password",
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: Icon(Icons.verified_user),
                      helperText: "At least 4 characters ",
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, perform login
                        checkLogin(context);
                      }
                    },
                    child: Text(
                      'Admin Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(SAVE_KEY, true);
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == 'nandhu' && password == '1234') {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (context) => AdminHome()), (route) => false);
    } else {
      const errorMessage = 'Username or Password does not match';

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
