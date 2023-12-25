import 'dart:io';
import 'package:bitebox/function/addfav.dart';
import 'package:bitebox/function/appbar.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:bitebox/user/cart.dart';
import 'package:bitebox/user/categories_screen.dart';
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../function/addcart_button.dart';

dbhelper help = dbhelper();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcontrol = TextEditingController();
 late Box<Addproducts> cartBox = Hive.box<Addproducts>(dbname);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    help.getall();
  }
  var dbp = dbhelper();
  List<AssetImage> assetimage = [
    AssetImage('images/break.jpg'),
    AssetImage('images/lunch.jpg'),
    AssetImage('images/diner.jpg'),
    AssetImage('images/burger.jpg'),
    AssetImage('images/drink.jpg'),
    AssetImage('images/piza.jpg'),
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width, 70.0))),
        backgroundColor: Colors.redAccent.shade700,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          ),
        ],
        title: Row(
          children: [
            Row(
              children: [
                Image.asset(
                  "images/logoss.png",
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '₿ITE ₿OX',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      'F O O D    D E L I V E R Y',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: Container(
            height: 76,
            child: Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    searchProducts(value);
                  },
                  controller: searchcontrol,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'What are you looking for...❔',
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          searchcontrol.clear();
                        },
                        icon: Icon(Icons.close)),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
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
                                builder: (context) =>
                                    CatBreakfast(categorys: names[index]),
                              ),
                            );
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Recommended',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                    valueListenable: productlist,
                    builder:
                        (context, List<Addproducts> addlist, Widget? child) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    products: addproducts,
                                  ),
                                ),
                              );
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
                                      File(addproducts.image!),
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
                                                  fontWeight: FontWeight.w700,
                                                ),
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
                                                addfav_button(
                                                    addproducts, context);
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                  Icons.shopping_cart_outlined),
                                              onPressed: () {
                                                setState(() {
                                                  checkCart(
                                                      addproducts, context);
                                                });
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void searchProducts(String value) {
    final product = cartBox.values.toList();
    final filteredProducts = product
        .where((products) =>
            products.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    productlist.value = filteredProducts;
  }
}
