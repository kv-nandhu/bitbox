// ignore: file_names
import 'package:bitebox/addressScreen.dart';
import 'package:bitebox/paymentScreen.dart';
import 'package:flutter/material.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addresssController = TextEditingController();
  final TextEditingController _cityController =TextEditingController();
    final TextEditingController _pincodeController =TextEditingController();

  String? _validateAddress(String? value) {
    String addressRegex = r'^[a-zA-Z]+';
    RegExp regex = RegExp(addressRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'This fiels is Empty';
    }
    return null;
  }

  String? _validateName(String? value) {
    String nameRegex = r'^[a-zA-Z ]+$';
    RegExp regex = RegExp(nameRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'This field id empty';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    String phoneRegex = r'^[6-9][0-9]{9}$';
    RegExp regex = RegExp(phoneRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validateAddresss(String? value) {
    String addresssRegex = r'^[0-9]{6,}$';
    RegExp regex = RegExp(addresssRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'This field is empty';
    }
    return null;
  }
    String? _validateCity(String? value) {
    String cityRegex = r'^[0-9]{6,}$';
    RegExp regex = RegExp(cityRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'fill in the field';
    }
    return null;
  }
  String? _validatePincode(String? value) {
    String pincodeRegex = r'^[0-9]{6,}$';
    RegExp regex = RegExp(pincodeRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'enter the valid pincode';
    }
    return null;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: Text("Add Address"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                TextFormField(
                  controller: _addressController,
                  validator: _validateAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Address Name",
                    hintText: "Enter Address Name",
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  validator: _validateName,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Name",
                    hintText: "Enter Name",
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  validator: _validatePhoneNumber,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Contact",
                    hintText: "Enter Phone Number",
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _addresssController,
                  validator: _validateAddresss,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Address",
                    hintText: "Enter the Address",
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _cityController,
                  validator: _validateCity,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "City",
                    hintText: "Enter the City",
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _pincodeController,
                  validator: _validatePincode,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Pincode",
                    hintText: "Enter the Pincode",
                  ),
                ),
                SizedBox(height: 40,),
                   Padding(
                    padding: EdgeInsets.all(10),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddressScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: Colors.redAccent.shade700,
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
