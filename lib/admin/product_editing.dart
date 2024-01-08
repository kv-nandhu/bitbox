import 'dart:io';
import 'package:bitebox/function/dbfun.dart';
import 'package:bitebox/models/user_product.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProductEditing extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final product;
  final int id;
  final int index;

  const ProductEditing(
      {super.key,
      required this.product,
      required this.index,
      required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _ProductEditingState createState() => _ProductEditingState();
}

class _ProductEditingState extends State<ProductEditing> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _productName;
  late TextEditingController _productAbout;
  late TextEditingController _productPrize;
    late TextEditingController _productUnit;
   late String _productCategory;
  String? _selectedImage; // Updated to use File for selected image
  // late TextEditingController _productdis;
  dbhelper  dbh=dbhelper();

  @override
  void initState() {
    super.initState();
    _productName = TextEditingController(text: widget.product.name);
    _productPrize = TextEditingController(text: widget.product.prize);
     _productAbout = TextEditingController(text: widget.product.about);
     _productUnit = TextEditingController(text: widget.product.unit);
        _productCategory = widget.product.category;

  }
   List<String> categories = [
    'Break fast',
    'Lunch',
    'Dinner',
    'Burger',
    'Drinks',
    'Piza'
  ];



  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.redAccent.shade700,
        title: const Text('Edit your product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: _selectImage1,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: _selectedImage != null
                          ? Image.file(
                              File(_selectedImage!),
                              // fit: BoxFit.cover,
                            )
                          : (widget.product.image.isNotEmpty
                              ? Image.file(File(widget.product.image))
                              : Container()), // Show an empty container if product's image is empty
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _productName,
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _productPrize,
                    decoration: const InputDecoration(
                      labelText: 'Product Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a price';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid price';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                   TextFormField(
                    controller: _productUnit,
                    decoration: const InputDecoration(
                      labelText: 'Product unit',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a unit';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid unit';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,

                    controller: _productAbout,
                    decoration: const InputDecoration(
                      labelText: 'Product Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
              //       
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 4, 4, 4)), // Set the background color
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Set the text color
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        widget.product.name = _productName.text;
                        widget.product.category = _productCategory;
                        
                        widget.product.prize = _productPrize.text;
                         widget.product.unit = _productUnit.text;
                        widget.product.about = _productAbout.text;

                        // Check if a new image is selected
                        if (_selectedImage != null) {
                          widget.product.image = _selectedImage;
                        }

                        _updateProduct();
                       
                        setState(() {});
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectImage1() async {
    final selectedimg1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedimg1 != null) {
      setState(() {
        _selectedImage = selectedimg1.path;
      });
    }
  }

  Future<void> _updateProduct() async {
  //  final newlist = productlist.value;
    final updateBox = await Hive.openBox<Addproducts>(dbname);

    // Update the product in Hive
    await updateBox.put(widget.id, widget.product);
    // newlist[widget.index] = widget.product;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    productlist.notifyListeners();
  
  }
}