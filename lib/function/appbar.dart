// import 'package:bitebox/function/dbfun.dart';
// import 'package:bitebox/user/cart.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hive/hive.dart';

// import '../models/user_product.dart';

// class MyAppBar {
//    TextEditingController searchcontrol = TextEditingController();
//     final Box<Addproducts> _productBox = Hive.box<Addproducts>(dbname);
//   setAppBar(context, String title,) {
//     return AppBar(
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
//           bottom: Radius.elliptical(MediaQuery.of(context).size.width,70.0)
//         )),
//         backgroundColor: Colors.redAccent.shade700,
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartScreen()),
//               );
//             },
//             child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 10, right: 15),
//             child: CircleAvatar(
//               backgroundImage: AssetImage('images/profile.jpg'),
//             ),
//           ),
//         ],
//         title: Row(
//           children: [
//             // Icon(Icons.location_on_outlined, color: Colors.black),
//             Row(
//               children: [
//                 Image.asset(
//                   "images/logoss.png",
//                   height: 80,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       '₿ITE ₿OX',
//                       style: TextStyle(fontSize: 20, color: Colors.black),
//                     ),
//                     Text(
//                       'F O O D    D E L I V E R Y',
//                       style: TextStyle(
//                         fontSize: 8,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(75),
//           child: Container(
//             height: 76,
//             child: Container(
//               width: double.infinity,
//               height: 50,
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20,right: 20),
//                 child: TextField(
//                    onChanged: (value) {
//                   searchProducts(value);
//                 },
//                   controller: searchcontrol,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(20)
//                     ),                
//                     hintText: 'What are you looking for...❔',hintStyle: TextStyle(color: Colors.white),
//                     suffixIcon:IconButton(
//                         onPressed: () {
//                           // setState(() {});
//                           searchcontrol.clear();
//                         },
//                         icon: Icon(Icons.close)),
//                     prefixIcon: IconButton(
//                       icon: Icon(Icons.search),
//                       onPressed: () {

//                       },
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),

//     );
//   }
//    void searchProducts(String value) {
//     final product = _productBox.values.toList();
//     final filteredProducts = product
//         .where((products) =>
//             products.name!.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//     productlist.value = filteredProducts;
//   }


// }



