// ignore: file_names
import 'dart:io';

import 'package:bitebox/function/addfav.dart';
import 'package:bitebox/function/addproduct_functions.dart';
import 'package:bitebox/models/user_favorite.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:bitebox/user/cart.dart';
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {


  @override
  void initState() {
    super.initState();
    getfavorite();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: Text("Favorite"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: addfavlist,
                builder:
                    (context, List<Addfavorite> addfvp, Widget? child) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: addfvp.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        mainAxisExtent: 290,
                      ),
                      itemBuilder: (context, index) {
                        final addfav = addfvp[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => DetailScreen(products: addproducts,),
                              // ),
                            // );
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
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(addfav.image!),
                                            height: 170,
                                            width: constraints.maxWidth,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        addfav.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .merge(
                                              const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(addfav.prize!),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                             deletefav(addfav.id!);
                                             
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
          ],
        ),
      ),
    );
  }
}
