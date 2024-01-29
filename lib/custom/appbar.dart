import 'package:bitebox/user/accountpage/profile.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/models/cart_model.dart';
import 'package:bitebox/user/cart.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../admin/admin_models/user_product.dart';

TextEditingController searchcontrol = TextEditingController();
Box<Addproducts> productBox = Hive.box<Addproducts>(dbname);
final Box<Cart> cartBox = Hive.box<Cart>('cart');

AppBar appbar(BuildContext context) {
  return AppBar(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom:
                Radius.elliptical(MediaQuery.of(context).size.width, 70.0))),
    backgroundColor: Colors.redAccent.shade700,
    actions: [
      Stack(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          Positioned(
              top: 8.0,
              right: 8.0,
              child: Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(
                  '${cartBox.length}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 10, right: 15),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage())),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/profile.jpg'),
          ),
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
                Text.rich(
                  TextSpan(
                    text: '₿ITE',
                    style: TextStyle(
                      color: Color.fromARGB(255, 4, 142, 221),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ₿OX',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
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
      child: SizedBox(
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
  );
}

void searchProducts(String value) {
  final product = productBox.values.toList();
  if (value.isEmpty) {
    productlist.value = product;
  } else {
    final filteredProducts = product
        .where((products) =>
            products.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    productlist.value = filteredProducts;
  }
}
