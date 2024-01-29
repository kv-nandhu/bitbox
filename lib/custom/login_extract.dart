// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class logintextpassword extends StatelessWidget {
  const logintextpassword({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
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
        helperText: "At least 6 characters ",
      ),
    );
  }
}

class logintextemail extends StatelessWidget {
  const logintextemail({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      maxLength: 20,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        } else if (!RegExp(
                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
            .hasMatch(value)) {
          return 'Enter a valid email address';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Color.fromARGB(255, 255, 255, 255),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
            width: 30,
          ),
        ),
        labelText: "Email",
        hintText: "Enter email",
        prefixIcon: Icon(Icons.email_outlined),
        suffixIcon: Icon(Icons.verified_user),
        helperText: "Enter your valid email",
      ),
    );
  }
}