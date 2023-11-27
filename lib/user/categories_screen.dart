// ignore: file_names
import 'dart:io';

import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:flutter/material.dart';

class CatBreakfast extends StatefulWidget {
  const CatBreakfast({super.key});

  @override
  State<CatBreakfast> createState() => _CatBreakfastState();
}

class _CatBreakfastState extends State<CatBreakfast> {
   var dbp=dbhelper();
  @override
  void initState() {
    super.initState();
    dbp.getall();
  }
  // ignore: non_constant_identifier_names
  Color Checkstock(String stocks) {
    if (stocks == 'In Stock') {
      return Colors.green;
    } else {
      return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent.shade700,
          title: Text("Break Fast"),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
          valueListenable: productlist,
          builder: (context, List<Addproducts> addlist, Widget? child) {
         return ListView.builder(
            itemCount: addlist.length,
            itemBuilder: (context, index) {
              final addproducts = addlist[index];
                // ignore: sized_box_for_whitespace
                return GestureDetector(
                
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Image.file(
                                      File(
                                        addproducts.image!,
                                      ),
                                    fit: BoxFit.cover,
                                    width: 90,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                trailing: Icon(Icons.favorite_border)
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //   '${productlist[index].stock}',
                                //   style: TextStyle(
                                //       color: Checkstock(productlist[index].stock),
                                //       fontWeight: FontWeight.w600),
                                // ),
                                Text('In Stock',style: TextStyle(color: Colors.green),),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailScreen(
                                                   
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
  })
  );
  }
}
