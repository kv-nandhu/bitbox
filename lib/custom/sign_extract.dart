// ignore_for_file: camel_case_types

import 'package:bitebox/comon_page/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class signlogin extends StatelessWidget {
  const signlogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
  
}
class signtext extends StatelessWidget {
  const signtext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sign up',
      style: GoogleFonts.rubik(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(255, 0, 0, 0),
          fontStyle: FontStyle.italic),
    );
  }
}
