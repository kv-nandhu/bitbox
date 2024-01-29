// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class addressnumber extends StatefulWidget {
  const addressnumber({
    super.key,
    required TextEditingController pincodeController,
    required TextEditingController cityController,
  }) : _pincodeController = pincodeController, _cityController = cityController;

  final TextEditingController _pincodeController;
  final TextEditingController _cityController;

  @override
  State<addressnumber> createState() => _addressnumberState();
}

class _addressnumberState extends State<addressnumber> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget._pincodeController,
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
        widget._cityController.text = value!;
      },
    );
  }
}

class addresscityadding extends StatelessWidget {
  const addresscityadding({
    super.key,
    required TextEditingController cityController,
  }) : _cityController = cityController;

  final TextEditingController _cityController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _cityController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 2,
        )),
        labelText: "City",
        hintText: "Enter the City",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter City Name';
        }
        return null;
      },
      onSaved: (value) {
        _cityController.text = value!;
      },
    );
  }
}

class addressadding extends StatelessWidget {
  const addressadding({
    super.key,
    required TextEditingController addresssController,
  }) : _addresssController = addresssController;

  final TextEditingController _addresssController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _addresssController,
      maxLines: 5,
      maxLength: 15,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 2,
        )),
        labelText: "Address",
        hintText: "Enter the Address Include Pin",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a address';
        }
        return null;
      },
      onSaved: (value) {
        _addresssController.text = value!;
      },
    );
  }
}

class addressname extends StatelessWidget {
  const addressname({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _nameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 2,
        )),
        labelText: "Name",
        hintText: "Enter Name",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a product name';
        }
        return null;
      },
      onSaved: (value) {
        _nameController.text = value!;
      },
    );
  }
}