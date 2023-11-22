import 'package:bitebox/editProfile.dart';
import 'package:bitebox/firstScreen.dart';
import 'package:bitebox/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     var val = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: Text("Profile"),
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
                    backgroundImage: AssetImage('images/profile.jpg'),
                    radius: 100,
                  ),
                  Text(
                    'Alexa Mills',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    'Alexamills@gmail.com',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Edit Profile',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
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
                  title: Text(
                    
                    'Privacy & Policy',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                        
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.more_horiz_sharp,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'More INFO',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.dark_mode,
                    color: Colors.black,
                  ),
                trailing: Switch(
                    value: val,
                    onChanged: (index) {
                      setState(() {
                        val = index;
                      });
                    },
                  ),
                  title: Text(
                    'Dark Mode',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                         
                  ),
                ),
              ),
            ),
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
  
  void Logouting(BuildContext ctx)async{
   Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>SigninLogin()));
 final _shared =await SharedPreferences.getInstance();
 _shared.setBool(SAVE_KEY, false);
  }
  

  void _launchURL(String url) async{

           Uri url = Uri.parse('https://www.freeprivacypolicy.com/live/35ea3631-c5de-4f36-8c20-f0460030b56b');
       if (await launchUrl(url)) {
              //dialer opened
          }else{
          SnackBar(content: Text("couldn't launch the page"));
      }
    } 
    void setState(Null Function() param0) {
}
}


