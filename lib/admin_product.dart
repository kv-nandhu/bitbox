// ignore_for_file: sort_child_properties_last

import 'package:bitebox/addproduct_functions.dart';
import 'package:bitebox/user_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey= GlobalKey<FormState>();
 final _productnameController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        centerTitle: true,
        title: Text('Add Products'),
      ),
      body: SingleChildScrollView(
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
              TextFormField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                    prefixIcon: Icon(Icons.edit),
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
                    child: Center(
                      child: Text(
                        'Add Image',
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                    ),
                    height: 160,
                    width: 160,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: const [
                      Icon(Icons.photo_camera_outlined),
                      SizedBox(
                        height: 20,
                      ),
                      Icon(Icons.photo)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    addButton();
                  },
                  child: Text('Save Item'))
            ],
          ),
        ),
      ),
    );
  }
//name validate
 String? validateProductName(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'enter product name';
    }
    return null;
  }


  //button

   Future<void> addButton() async {
    final _name = _productnameController.text.trim();
 
    
    if (_formKey.currentState!.validate() &&
        _name.isNotEmpty ) {
      final _add = Addproducts(
          name: _name,
        );
      addproduct(_add);
      showSnackBar(context, 'Added Succesfully!');
    
      _productnameController.clear();
    } else {
      showSnackBar(context, 'Product adding failed!');
     
      _productnameController.clear();
    }
  }


    //snackbar

     void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }
  }


