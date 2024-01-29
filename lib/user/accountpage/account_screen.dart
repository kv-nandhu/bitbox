import 'dart:io';
import 'package:bitebox/custom/profile_extract.dart';
import 'package:bitebox/comon_page/first_screen.dart';
import 'package:bitebox/comon_page/sign_screen.dart';
import 'package:bitebox/main.dart';
import 'package:bitebox/models/user_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}                                               

class _ProfileScreenState extends State<ProfileScreen> {
 String useremail='';
 User? currentUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }
  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    useremail = prefs.getString('currentUser') ?? '';
    final userBox = await Hive.openBox<User>('users');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == useremail,
    );
    setState(() {
      getall2();
    });
  }
   // ignore: non_constant_identifier_names
   void Logoutbox(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Logout'),
        content:Text('You Want Logout application'),
        actions: [
          ElevatedButton(onPressed: (){
            Logouting(context);
          }, child: Text('YES')),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
           child: Text('NO')),
      ]);
    });
  }

  // ignore: non_constant_identifier_names
  void Logouting(BuildContext ctx)async{
   Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (context)=> SigninLogin()), (route) => false);
 final shared =await SharedPreferences.getInstance();
 shared.setBool(SAVE_KEY, false);
  }

  void _launchURL(String url) async{

           Uri url = Uri.parse('https://www.freeprivacypolicy.com/live/35ea3631-c5de-4f36-8c20-f0460030b56b');
       if (await launchUrl(url)) {
          }else{
          SnackBar(content: Text("couldn't launch the page"));
      }
    } 

  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(microseconds: 1),(){
setState(() {
  
});
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: Text("Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 224, 224),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    CircleAvatar(
                     radius: 100,
                     backgroundImage: FileImage(File('${currentUser?.number}')) ),
                  Text("${ currentUser?.name}"),
                  SizedBox(
                    height: 2.5,
                  ),
                  Text(''),
                ],
              ),
            ),
            profile(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () =>
                                _launchURL('https://www.freeprivacypolicy.com/live/35ea3631-c5de-4f36-8c20-f0460030b56b'),
                  leading: Icon(
                    Icons.edit_document,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(  'Privacy & Policy',style:GoogleFonts.poppins(color: Colors.black, fontSize: 17),              
                  ),
                ),
              ),
            ),
            about(),
             termsandcondition(),      
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {
                       Logoutbox(context);
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Sign Out',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),          
          ],
        ),
      ),
     );
  }
}

