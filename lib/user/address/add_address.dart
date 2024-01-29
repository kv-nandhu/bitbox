import 'package:bitebox/custom/addadress_extract.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import '../../function/address_function.dart';
import '../../models/address_model.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}
class _AddAddressScreenState extends State<AddAddressScreen> {
  late Box<Address> addressBox = Hive.box<Address>('address');
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.redAccent.shade700,
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
                addressname(nameController: _nameController),
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
      ),
    ),
    labelText: "Contact",
    hintText: "Enter Phone Number",
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    bool isValidPhone = RegExp(r'^\d{10}$').hasMatch(value);

    if (!isValidPhone) {
      return 'Please enter a valid 10-digit phone number';
    } else {
      return null;
    }
  },
  onSaved: (value) {
    _phoneController.text = value!;
  },
),

                SizedBox(height: 20),
                addressadding(addresssController: _addresssController),
                SizedBox(height: 20),
                addresscityadding(cityController: _cityController),
                SizedBox(
                  height: 20,
                ),
                addressnumber(pincodeController: _pincodeController, cityController: _cityController),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 50,
                    width: 400,
                   
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _addAddress(context);
                        },
                        );
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
  Future<void> _addAddress(BuildContext context) async {
    final username = _nameController.text;
    final number = _phoneController.text;
    final address = _addresssController.text;
    final city = _cityController.text;
    final pincode = _pincodeController.text;
   
      if (username.isNotEmpty &&
          number.isNotEmpty &&
          address.isNotEmpty &&
          city.isNotEmpty &&
          pincode.isNotEmpty) {
        final addAddress = Address(
            usrname: username,
            number: number,
            address: address,
            city: city,
            pincode: pincode, id: -1);
        addtoaddress(addAddress);
        Navigator.pop(context);
        showDailogealert(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please fill all Datas'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 2),
        ));
      }
  
  }
  void showDailogealert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Added address',
          ),
          content: Text('Address add succesfull'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }
  void showDailoglimit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Address Limit',
          ),
          content: Text('You can add only few address!!'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }
}

