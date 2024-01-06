import 'package:bitebox/accountpage/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'About',
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 224, 224),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 9,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('images/logoss.png'),
                      radius: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '₿ITE ₿OX',
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                        Text(
                          'F O O D    D E L I V E R Y',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 5, 185),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Title(
                        color: Color.fromARGB(255, 0, 0, 0),
                        child: Text(
                          'Your Ultimate Gadget Shoping Experience',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                          SizedBox(
                          height: 15,
                          ),
                
                    Text('Welcome to "Bite Box" your go to destinition for a seamless and delighful gadget shoping experience. "Bite Box" is a cutting-edge flutter application of e-comerce with the efficiecy of a local Hive database. Discover the latest and trendiest gadgets, shop with confidence and enjoy personalized journy tailored to your preference ')
                ],
                ),
              ),
            ],
          ),
        ));
  }
}
