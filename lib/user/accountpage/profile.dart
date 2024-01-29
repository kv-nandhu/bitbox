// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, avoid_print, avoid_unnecessary_containers

import 'dart:io';

import 'package:bitebox/user/accountpage/edit_profile.dart';
import 'package:bitebox/comon_page/login_screen.dart';
import 'package:bitebox/models/user_login.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../comon_page/sign_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userEmail = '';
  User? currentUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('currentUser') ?? '';
    
    final userBox = await Hive.openBox<User>('users');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == userEmail,
    );
    print('${currentUser!.image}');
    setState(() {
      getall2();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('profile'),
        centerTitle: true,
          backgroundColor: Colors.redAccent.shade700,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditProfileScreen(currentUser: currentUser,)));
          }, icon: Icon(Icons.edit))
        ],),
        body: currentUser != null
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 600,
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                             radius: 150,
                              backgroundImage: FileImage(File(currentUser!.number))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                          title: Text(
                            "${currentUser!.name}",
                          ),
                        ),
                           ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.red[400],
                      ),
                      title: Text(
                        "${currentUser!.email}",
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone_iphone_rounded,
                        color: Colors.red[400],
                      ),
                      title: Text(
                        "${currentUser!.number}",
                      ),   
                    ),
                      ],
                    ),
                  ],
                ),
              )
            : Center(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Text("USER NOT LOGGED IN"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text("PROCEED TO LOGIN"))
                    ],
                  ),
                ),
              ));
  }
}
