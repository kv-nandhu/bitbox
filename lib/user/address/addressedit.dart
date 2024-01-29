import 'package:bitebox/custom/addtressedit_extract.dart';
import 'package:bitebox/function/addressedit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAddress extends StatefulWidget {
  final String name;
  final String contact;
  final String address;
  final String city;
  final String pincode;
  final int id;
  const EditAddress(
      {required this.name,
      required this.contact,
      required this.address,
      required this.city,
      required this.pincode,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addresssController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.name;
    _phoneController.text = widget.contact;
    _addresssController.text = widget.address;
    _cityController.text = widget.city;
    _pincodeController.text = widget.pincode;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Add Address",
          style: GoogleFonts.rubik(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                namecontroller(nameController: _nameController),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Contact",
                    hintText: "Enter Phone Number",
                  ),
                  validator: (value) {
                    if (!isPhone(value!)) {
                      return 'Please enter valid number';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _phoneController.text = value!;
                  },
                ),
                SizedBox(height: 20),
                addresscontrolling(addresssController: _addresssController),
                SizedBox(height: 20),
                citycontrolling(cityController: _cityController),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _pincodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Pincode",
                    hintText: "Enter the City Pincode",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter City Pincode';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cityController.text = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          edit_address(
                              widget.id,
                              _nameController.text,
                              _phoneController.text,
                              _addresssController.text,
                              _cityController.text,
                              _pincodeController.text);
                          Navigator.pop(context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 8, 212, 8),
                      ),
                      child: Text(
                        'Save Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
