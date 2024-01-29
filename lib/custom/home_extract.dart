// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:bitebox/function/addcart_button.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/admin/admin_models/user_product.dart';
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:bitebox/user/whishlist/addfav.dart';
import 'package:flutter/material.dart';

class homecliprect extends StatelessWidget {
  const homecliprect({
    super.key,
    required this.addproducts,
  });

  final Addproducts addproducts;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: Container(
        color: Colors.grey,
        child: Placeholder(
          child: Image.file(
            File(addproducts.image!),
            height: 170,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

ValueListenableBuilder<List<Addproducts>> homevaluelistnable() {
  return ValueListenableBuilder(
    valueListenable: productlist,
    builder: (context, List<Addproducts> addlist, Widget? child) {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: addlist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 299,
        ),
        itemBuilder: (context, index) {
          final addproducts = addlist.reversed.toList()[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
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
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  child: Column(
                    children: [
                      homecliprect(addproducts: addproducts),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              addproducts.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: getIcon(addproducts),
                                  onPressed: () {
                                    addfav_button(addproducts, context);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.shopping_cart_outlined),
                                  onPressed: () {
                                    checkCart(addproducts, context);
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
              ),
            ),
          );
        },
      );
    },
  );
}
