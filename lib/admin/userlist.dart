import 'package:bitebox/admin/admin_home.dart';
import 'package:bitebox/models/user_login.dart';
import 'package:bitebox/comon_page/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  @override
  void initState() {
    super.initState();
    getall2();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
         backgroundColor: Colors.redAccent.shade700,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHome()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
      
        centerTitle: true,
        title: Text(
          'Users List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: userslist,
          builder: (context, List<User> signuplist, Widget? child) {
            //  final userdatas = userBox.values.toList();
            return ListView.builder(
              itemCount: signuplist.length,
              itemBuilder: (BuildContext context, int index) {
                final userdata = signuplist[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/star.jpg'),
                                    radius: 43,
                                    backgroundColor: Colors.blue,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userdata.name,
                                      style: GoogleFonts.rubik(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, top: 8),
                                      child: Text(userdata.email,
                                          style: GoogleFonts.rubik(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Text(userdata.number,
                                        style: GoogleFonts.rubik(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Icon(Icons.verified_sharp),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}