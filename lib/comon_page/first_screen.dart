// ignore: file_names
import 'package:bitebox/admin/admin_login.dart';
import 'package:bitebox/comon_page/login_screen.dart';
import 'package:bitebox/comon_page/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninLogin extends StatefulWidget {
  const SigninLogin({super.key});

  @override
  State<SigninLogin> createState() => _SigninLoginState();
}

class _SigninLoginState extends State<SigninLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Login1.jpg",), fit: BoxFit.cover)
               ),
             
    
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      "STAY HOME",
                      style: GoogleFonts.poppins(
                          fontSize: 35, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "WE DELIVER",
                      style: GoogleFonts.poppins(
                          fontSize: 35, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text("LOGIN")),
                    SizedBox(
                      height: 10,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()),
                            );
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Color.fromARGB(255, 46, 0, 230)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminLogin()));
                            },
                            child: Text("Admin Login")),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
