// ignore: file_names
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:bitebox/user/category_data.dart';
import 'package:google_fonts/google_fonts.dart';

class CatBurger extends StatefulWidget {
  const CatBurger({super.key});

  @override
  State<CatBurger> createState() => _CatBurgerState();
}

class _CatBurgerState extends State<CatBurger> {
  icon() => null;
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
          title: Text("Burger"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 160,
                child: Card(
                  elevation: 10,
                  child: Column(children: [
                    ListTile(

                        // ignore: sized_box_for_whitespace
                        leading: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18)),
                          child: Image.asset(
                            '${productlist[index].imagesp}',
                            fit: BoxFit.cover,
                            width: 90,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productlist[index].name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Text(
                              productlist[index].unit,
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Text(
                              '₹${productlist[index].rate}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        trailing: Icon(Icons.favorite_border)),
                    Padding(
                      padding: const EdgeInsets.all(11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${productlist[index].stock}',
                            style: TextStyle(
                                color: Checkstock(productlist[index].stock),
                                fontWeight: FontWeight.w600),
                          ),
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
            );
          },
        ));
  }
}
