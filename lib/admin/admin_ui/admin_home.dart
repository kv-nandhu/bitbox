// ignore: file_names
import 'package:bitebox/custom/adminhome_extract.dart';
import 'package:bitebox/admin/admin_ui/admin_product/product_list.dart';
import 'package:bitebox/admin/admin_ui/userlist.dart';
import 'package:bitebox/main.dart';
import 'package:bitebox/comon_page/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: Text("Admin Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                  Image.asset(
              "images/logoss.png",
              height: 80,
            ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text.rich(
                  TextSpan(
                    text: '₿ITE',
                    style: TextStyle(
                      color: Color.fromARGB(255, 4, 142, 221),
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ₿OX',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'F O O D    D E L I V E R Y',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
                SizedBox(
                  height: 55,
                ),
                adminhomeadditems(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  // clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Product List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductListing()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  // clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Users List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsersListScreen()));
                    },
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
                adminhomeorderdeteail(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  // clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Log out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    onTap: () {
                      AdminLogout(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void AdminLogout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Logout'),
              content: Text('You Want Logout application'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Logouting(context);
                    },
                    child: Text('YES')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('NO')),
              ]);
        });
  }

  // ignore: non_constant_identifier_names
  void Logouting(BuildContext ctx) async {
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => SigninLogin()));
    final shared = await SharedPreferences.getInstance();
    shared.setBool(SAVE_KEY, false);
  }
}
