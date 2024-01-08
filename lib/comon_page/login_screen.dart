import 'package:bitebox/comon_page/sign_screen.dart';
import 'package:bitebox/models/user_login.dart';
import 'package:bitebox/user/main_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: constant_identifier_names
// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    'Login',
                    style: GoogleFonts.rubik(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    cursorColor: const Color.fromARGB(255, 255, 255, 255),
                    controller: emailController,
                    maxLength: 20,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 248, 248, 248),
                            width: 2,
                          )),
                          
                      labelText: "Email",
                      hintText: "Enter email",
                      prefixIcon: Icon(Icons.email_outlined),
                      suffixIcon: Icon(Icons.verified_user),
                      helperText: "Enter your valid email",
                      
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    maxLength: 10,
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
                        helperText: "Atleast 6 characters "),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        login(emailController.text, passwordController.text,
                            context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New to here?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void login(String email, String password, BuildContext context) async {
    final usersBox =
        await Hive.openBox<User>('users'); // Open the Hive box for users
    User? user;
    for (var i = 0; i < usersBox.length; i++) {
      final currentUser = usersBox.getAt(i);
      if (currentUser?.email == email && currentUser?.password == password) {
        user = currentUser;
        break;
      }
    }
    if (user != null) {
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool("saveUserEmail", true);
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => HomesScreenPage()));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (home)=>HomesScreenPage()), (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid email or password'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  Future<void> saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUser', email);
  }
}
//logout button
