
import 'package:bitebox/accountpage/profile.dart';
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
           backgroundColor: Colors.redAccent.shade700,
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
                        Text.rich(
                          TextSpan(
                            text: '₿ITE',
                            style: TextStyle(
                              color: Color.fromARGB(255, 4, 142, 221),
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ₿OX',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Text(
                        //   '₿ITE ₿OX',
                        //   style: TextStyle(fontSize: 40, color: Colors.black),
                        // ),
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
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  children: [
                    Title(
                        color: Color.fromARGB(255, 0, 0, 0),
                        child: Text(
                          'Your Ultimate Food Delivery Experience',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '''"Bite Box" is a Flutter-based mobile application designed to streamline the food delivery experience, similar to popular platforms like Swiggy. The key feature that sets Bite Box apart is its reliance on a local database, specifically Hive, to manage and store food-related data. This ensures efficient data retrieval and storage, contributing to a seamless user experience''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Title(
                        color: Colors.black,
                        child: Text('Extensive Key Features',style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),)),
                         SizedBox(
                      height: 15,
                    ),
                    Text('''Bite Box utilizes Hive, a lightweight and efficient NoSQL database for Flutter, to manage and store various aspects of the application's data. This includes information about food items, categories, and user preferences. The local database enhances speed and responsiveness.
Users can explore a diverse range of food items categorized based on different criteria such as cuisine, dietary preferences, and popularity. The application provides an intuitive interface for users to browse through available options.
Category-Based Organization: Bite Box categorizes food items to simplify the browsing process. Users can easily navigate through categories like Breakfast, Lunch, Dinner, Snacks, Desserts, etc. This organized approach enhances user experience and helps users quickly find what they are looking for.
User-Friendly Interface: The application boasts a user-friendly interface, ensuring a smooth and enjoyable user experience. Intuitive navigation, visually appealing design, and interactive elements contribute to the overall usability of the application.
Bite Box allows users to place food orders directly through the app. Users can select their desired items, customize orders, and proceed with secure and convenient online payment options.
 ''')
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
