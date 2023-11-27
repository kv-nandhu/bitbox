import 'dart:io';
import 'package:bitebox/admin/admin_product.dart';
import 'package:bitebox/admin/product_editing.dart';
import 'package:bitebox/costum.dart';
import 'package:bitebox/function/addproduct_functions.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class ProductListing extends StatefulWidget {
  const ProductListing({super.key});

  @override
  _ProductListingState createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  dbhelper dbh = dbhelper();
  @override
  void initState() {
    super.initState();
    dbh.getall();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              
            });
          }, icon: Icon(Icons.restore))
        ],
        backgroundColor: Colors.redAccent.shade700,
        title: Text('product list'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: productlist,
        builder: (context, List<Addproducts> addlist, Widget? child) {
          return ListView.builder(
            itemCount: addlist.length,
            itemBuilder: (context, index) {
              final product = addlist[index];
              final imagePath = product.image;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  startActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                        backgroundColor: Colors.red,
                        label: 'Delete',
                        autoClose: true,
                        icon: Icons.delete,
                        onPressed: (context) {
                        dbh.delete(product.id!);
                        })
                  ]),
                  endActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                        backgroundColor: Colors.green,
                        label: 'Edit',
                        // ignore: deprecated_member_use
                        icon: FontAwesomeIcons.edit,
                        autoClose: true,
                        onPressed: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductEditing(
                                product: product,
                                index: index,
                                 id: product.id!,
                              ),
                            ),
                          );
                        })
                  ]),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 149,
                            height: 201,
                         
                            child: imagePath != null
                                ? Image.file(File(
                                    imagePath)) 
                                : Placeholder(), 
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 173,
                          top: 15,
                          child: customeText(
                          
                            texts: "${product.name}",
                            textcolor: Colors.black,
                            textsize: 18,
                            textweight: FontWeight.w800,
                            textspace: 1.80,
                          ),
                        ),
                       
                        Positioned(
                          left: 173,
                          top: 45,
                          child: customeText(
                            texts: "₹${product.prize}",
                            textcolor: Color.fromARGB(255, 254, 3, 3),
                            textsize: 18,
                            textweight: FontWeight.w800,
                            textspace: 1.80,
                          ),
                        ),
                        Positioned(
                          left: 173,
                          top: 75,
                          child: customeText(     
                            texts: "Unit:${product.unit}",
                            textcolor: Colors.black,
                            textsize: 12,
                            textweight: FontWeight.w500,
                            textspace: 1.80,
                          ),
                        ),
                         Positioned(
                          left: 173,
                          top: 105,
                          child: customeText(     
                            texts: "${product.about}",
                            textcolor: Colors.black,
                            textsize: 12,
                            textweight: FontWeight.w500,
                            textspace: 1.80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: const Icon(Icons.add),
        onPressed: () {
          _navigateToAddPage();
        },
      ),
    );
  }

  void _navigateToAddPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductPage()),
    );
  }
}