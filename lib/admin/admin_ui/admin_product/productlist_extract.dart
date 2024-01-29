// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:bitebox/custom/costum.dart';
import 'package:bitebox/admin/admin_models/user_product.dart';
import 'package:flutter/material.dart';

class productlistabout extends StatelessWidget {
  const productlistabout({
    super.key,
    required this.product,
  });
  final Addproducts product;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 173,
      top: 105,
      child: customeText(
        texts: "${product.about}",
        textcolor: Colors.black,
        textsize: 12,
        textweight: FontWeight.w500,
        textspace: 1.80,
      ),
    );
  }
}
class productlistunit extends StatelessWidget {
  const productlistunit({
    super.key,
    required this.product,
  });
  final Addproducts product;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 173,
      top: 75,
      child: customeText(
        texts: "Unit:${product.unit}",
        textcolor: Colors.black,
        textsize: 12,
        textweight: FontWeight.w500,
        textspace: 1.80,
      ),
    );
  }
}
class productlistprize extends StatelessWidget {
  const productlistprize({
    super.key,
    required this.product,
  });

  final Addproducts product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 173,
      top: 45,
      child: customeText(
        texts: "₹${product.prize}",
        textcolor: Color.fromARGB(255, 254, 3, 3),
        textsize: 18,
        textweight: FontWeight.w800,
        textspace: 1.80,
      ),
    );
  }
}
class productlistname extends StatelessWidget {
  const productlistname({
    super.key,
    required this.product,
  });

  final Addproducts product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 173,
      top: 15,
      child: customeText(
        texts: "${product.name}",
        textcolor: Colors.black,
        textsize: 18,
        textweight: FontWeight.w800,
        textspace: 1.80,
      ),
    );
  }
}
class productlistimage extends StatelessWidget {
  const productlistimage({
    super.key,
    required this.imagePath,
  });
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 149,
        height: 201,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: imagePath != null
            ? Image.file(File(imagePath!))
            : Placeholder(),
      ),
    );
  }
}
