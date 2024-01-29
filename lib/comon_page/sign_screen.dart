// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:bitebox/comon_page/first_screen.dart';
import 'package:bitebox/custom/sign_extract.dart';
import 'package:bitebox/models/user_login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<List<User>> userslist = ValueNotifier([]);
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
    String? _selectedImage;
  final picker = ImagePicker();
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
                      height: 40,
                    ),
                    InkWell(
                      onTap: _selectedImage1,
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: _selectedImage != null
                        ?FileImage(File(_selectedImage!))
                        :null,
                        child: _selectedImage == null
                        ? Text('🙈') : null
                      ),
                    ),
                    signtext(),
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
                              _phoneController.text,
                              _selectedImage!);
                          // Navigator.pop(context);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SigninLogin()));
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                    signlogin(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
 void _selectedImage1() async {
    final selectedimg1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedimg1 != null) {
      setState(() {
        _selectedImage = selectedimg1.path;
      });
    }
  }
  void signup(String email, String password, BuildContext context, String name, String image,
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
          User(email: email, password: password, name: name, number: number, image: image, id: -1);
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
