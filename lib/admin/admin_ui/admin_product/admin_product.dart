// ignore_for_file: sort_child_properties_last

import 'dart:io';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/admin/admin_models/user_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}
class _AddProductPageState extends State<AddProductPage> {
  var help = dbhelper();
  final _formKey = GlobalKey<FormState>();
  final _productnameController = TextEditingController();
  final _productprizeController = TextEditingController();
  final _productaboutController = TextEditingController();
  final _productunitController = TextEditingController();
  late String _productCategory;
  File? imageSelect;
  List<String> categories = [
    'Break Fast',
    'Lunch',
    'Dinner',
    'Burger',
    'Drinks',
    'Piza'
  ];
  @override
  void initState() {
    super.initState();
    _productCategory = categories.first;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        centerTitle: true,
        title: Text('Add Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _productnameController,
                  validator: validateProductName,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                      prefixIcon: Icon(Icons.abc),
                      label: Text(
                        'Add Product Name',
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _productprizeController,
                  validator: validateProductPrize,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                      prefixIcon: Icon(Icons.attach_money),
                      label: Text(
                        'Add Product Prize',
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  value: _productCategory,
                  decoration: const InputDecoration(
                    fillColor: Color(0xABFFFEFE),
                    labelText: 'product category',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _productCategory = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _productunitController,
                  validator: validateProductAbout,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                      label: Text(
                        'Add Product unit',
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 7,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  controller: _productaboutController,
                  validator: validateProductAbout,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                      label: Text(
                        'Add Product Details',
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: imageSelect != null
                          ? Image.file(imageSelect!, fit: BoxFit.cover)
                          : const Icon(Icons.person),
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Icon(Icons.photo_camera_outlined),
                        SizedBox(
                          height: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              _pickImage();
                            },
                            icon: Icon(Icons.photo))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      addButton();
                    },
                    child: Text('Save Item'))
              ],
            ),
          ),
        ),
      ),
    );
  }
  String? validateProductName(String? value) {
    final trimmedvalue = value?.trim();
    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'enter product name';
    }
    return null;
  }
  String? validateProductPrize(String? value) {
    final trimmedvalue = value?.trim();
    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'enter product prize';
    }
    return null;
  }
  String? validateProductUnit(String? value) {
    final trimmedvalue = value?.trim();
    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'enter product unit';
    }
    return null;
  }
  String? validateProductAbout(String? value) {
    final trimmedvalue = value?.trim();
    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'enter product details';
    }
    return null;
  }
  String? validateProductCategory(String? value) {
    final trimmedvalue = value?.trim();
    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'Select product Category';
    }
    return null;
  }
  Future<void> addButton() async {
    final name = _productnameController.text.trim();
    final prize = _productprizeController.text.trim();
    final unit = _productunitController.text.trim();
    final about = _productaboutController.text.trim();
    final category = _productCategory.toString();
    if (imageSelect == null) {
      return;
    }
    if (_formKey.currentState!.validate() &&
        name.isNotEmpty &&
        prize.isNotEmpty &&
        unit.isNotEmpty &&
        about.isNotEmpty &&
        category.isNotEmpty) {
      final add = Addproducts(
        id: -1,
        name: name,
        prize: prize,
        unit: unit,
        about: about,
        category: category,
        image: imageSelect!.path.toString(),
      );
      help.save(add);
      showSnackBar(context, 'Added Succesfully!');
      _productnameController.clear();
    } else {
      showSnackBar(context, 'Product adding failed!');
      _productnameController.clear();
    }
  }
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageSelect = File(pickedFile.path);
      });
    }
  }
}
