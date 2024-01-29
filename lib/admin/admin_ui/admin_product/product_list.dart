import 'package:bitebox/admin/admin_ui/admin_product/admin_product.dart';
import 'package:bitebox/admin/admin_ui/admin_product/product_editing.dart';
import 'package:bitebox/admin/admin_ui/admin_product/productlist_extract.dart';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/admin/admin_models/user_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({super.key});
  @override
  // ignore: library_private_types_in_public_api
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
                  child: SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Stack(
                      children: [
                        productlistimage(imagePath: imagePath),
                        productlistname(product: product),
                        productlistprize(product: product),
                        productlistunit(product: product),
                        productlistabout(product: product),
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
