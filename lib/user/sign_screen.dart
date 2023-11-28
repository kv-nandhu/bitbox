// ignore_for_file: use_build_context_synchronously

import 'package:bitebox/user/first_screen.dart';
import 'package:bitebox/user/login_screen.dart';
import 'package:bitebox/models/user_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<User>> userslist = ValueNotifier([]);

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _validateEmail(String? value) {
    String emailRegex = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(emailRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateName(String? value) {
    String nameRegex = r'^[a-zA-Z ]+$';
    RegExp regex = RegExp(nameRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid name';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    String phoneRegex = r'^[0-9]{10}$';
    RegExp regex = RegExp(phoneRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    String passwordRegex = r'^[0-9]{6,}$';
    RegExp regex = RegExp(passwordRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Password must be at least 6 characters long and contain at least one uppercase letter, one lowercase letter, and one digit';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

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
          padding: const EdgeInsets.only(top: 65),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Sign up',
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
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: _validateName,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.number,
                      validator: _validatePhoneNumber,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: _validatePassword,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: _validateConfirmPassword,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signup(
                              _emailController.text,
                              _passwordController.text,
                              context,
                              _nameController.text,
                              _phoneController.text);
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already has an account?',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SigninLogin()),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signup(String email, String password, BuildContext context, String name,
      String number) async {
    // await Hive.initFlutter(); // Initialize Hive
    await Hive.openBox<User>('users'); // Open the Hive box for users

    final usersBox = Hive.box<User>('users');

    final userExists = usersBox.values.any((user) => user.email == email);
    if (userExists) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('User already exists'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      final user =
          User(email: email, password: password, name: name, number: number);
      usersBox.add(user);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Account created successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      getall2();
    }
  }
}

Future<void> getall2() async {
  final save = await Hive.openBox<User>('users');
  userslist.value.clear();
  userslist.value.addAll(save.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  userslist.notifyListeners();
}
