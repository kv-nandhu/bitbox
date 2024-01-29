// ignore: file_names
import 'dart:io';
import 'package:bitebox/user/whishlist/addfav.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/admin/admin_models/user_product.dart';
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:flutter/material.dart';

class CatBreakfast extends StatefulWidget {
  final String categorys;
  const CatBreakfast({required this.categorys, Key? key}) : super(key: key);

  @override
  State<CatBreakfast> createState() => _CatBreakfastState();
}

class _CatBreakfastState extends State<CatBreakfast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent.shade700,
          title: Text(widget.categorys),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
            valueListenable: productlist,
            builder: (context, List<Addproducts> cataddlist, Widget? child) {
              final filterdlist = cataddlist
                  .where((product) => product.category == widget.categorys)
                  .toList();
              if (filterdlist.isEmpty) {
                return Center(
                  child: Text(('No Product')),
                );
              } else {
                return ListView.builder(
                  itemCount: filterdlist.length,
                  itemBuilder: (context, index) {
                    final addproducts = filterdlist[index];
                    // ignore: sized_box_for_whitespace
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 160,
                          child: Card(
                            elevation: 10,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ListTile(
                                  // ignore: sized_box_for_whitespace
                                  leading: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Image.file(
                                      File(
                                        addproducts.image!,
                                      ),
                                      fit: BoxFit.cover,
                                      width: 90,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${addproducts.name}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        '₹${addproducts.prize}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: getIcon(addproducts),
                                    onPressed: () {
                                      setState(() {
                                        addfav_button(addproducts, context);
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(11),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                        products: addproducts,
                                                      )));
                                        },
                                        style: ButtonStyle(),
                                        child: Text('Details')),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }));
  }
}
