// ignore: file_names
import 'package:bitebox/admin/admin_product.dart';
import 'package:bitebox/admin/product_list.dart';
import 'package:bitebox/admin/userlist.dart';
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
                  height: 35,
                ),
                Text(
                  "BiteBox",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Add Items',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => AddProductPage()));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UsersListScreen()));
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
                      'Orders Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onTap: () {},
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
                      'Log out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    onTap: () {
                      AdminLogout(context);
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SigninLogin()));
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
    void AdminLogout(BuildContext context){
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
}
