// ignore: file_names
import 'dart:io';
import 'package:bitebox/whishlist/addfav.dart';
import 'package:bitebox/function/addproduct_functions.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/models/user_favorite.dart';
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

dbhelper help = dbhelper();

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late Box<Addfavorite> addfavBox = Hive.box<Addfavorite>('add_fav');
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
      ),
      body: addfavBox.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/favorite.png',
                    color: Colors.red,
                  ),
                  Text(
                    "Your favorite is Currently Empty❗",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10,left: 6,right: 6),
              child: Column(
                children: [
                  ValueListenableBuilder(
                      valueListenable: addfavlist,
                      builder:
                          (context, List<Addfavorite> addfvp, Widget? child) {
                        return Expanded(
                          child: GridView.builder(
                            itemCount: addfvp.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              mainAxisExtent: 290,
                            ),
                            itemBuilder: (context, index) {
                              final addfav = addfvp[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        products: addfav,
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
                                                        fontWeight:
                                                            FontWeight.w700),
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
                                                    removefav(
                                                        context, addfav.id!);
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons
                                                      .shopping_cart_outlined),
                                                  onPressed: () {
                                                    // setState(() {
                                                    //     checkCart(
                                                    //         addfavl, context);
                                                    //   });
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
