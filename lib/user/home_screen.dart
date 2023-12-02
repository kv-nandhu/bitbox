import 'dart:io';
import 'package:bitebox/function/addfav.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/user/cart.dart';
import 'package:bitebox/user/categories_screen.dart';
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dbp=dbhelper();
  @override
  void initState() {
    super.initState();
    dbp.getall();
  }
 
  icon() => null;
  List<AssetImage> assetimage = [
    AssetImage('images/break.jpg'),
    AssetImage('images/lunch.jpg'),
    AssetImage('images/diner.jpg'),
    AssetImage('images/burger.jpg'),
    AssetImage('images/drink.jpg'),
    AssetImage('images/piza.jpg'),
    // AssetImage('images/piz.jpg'),
  ];
  List<String> names = [
    'Break Fast',
    'Lunch',
    'Dinner',
    'Burger',
    'Drinks',
    'Piza',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          ),
        ],
        title: Row(
          children: const [
            Icon(Icons.location_on_outlined, color: Colors.black),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'delivery to',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                Text(
                  'HSR Layout,Bangalore',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                )),
      
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CatBreakfast(categorys: names[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: assetimage[index],
                          ),
                          SizedBox(height: 4),
                          Text(
                            names[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              
            ),
      
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recommended',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                )),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: productlist,
                builder: (context, List<Addproducts> addlist, Widget? child) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: addlist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        mainAxisExtent: 290,
                      ),
                      itemBuilder: (context, index) {
                        final addproducts = addlist[index];
                        return GestureDetector(
                          onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen( products: addproducts,)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                  child: Image.file(
                                    File(
                                      addproducts.image!,
                                    ),
      
                                    // image: image[index],
                                    height: 170,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        addproducts.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .merge(
                                              const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text('₹${addproducts.prize}'),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.favorite_border),
                                            onPressed: () {
                                              addfav_button(addproducts, context);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                                Icons.shopping_cart_outlined),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CartScreen()));
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                })
      
            //
          ],
        ),
      ),
    );
  }
}