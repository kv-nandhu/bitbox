import 'package:bitebox/custom/appbar.dart';
import 'package:bitebox/models/cart_model.dart';
import 'package:bitebox/custom/home_extract.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/admin/admin_models/user_product.dart';
import 'package:bitebox/user/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

dbhelper help = dbhelper();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcontrol = TextEditingController();
  late Box<Addproducts> productBox = Hive.box<Addproducts>(dbname);
  final Box<Cart> cartBox = Hive.box<Cart>('cart');

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    await Hive.openBox<Addproducts>(dbname);
    productBox = Hive.box<Addproducts>(dbname);
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
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    return Scaffold(
      appBar: appbar(context),
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
                                  backgroundColor: Colors.grey,
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
                  homevaluelistnable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
