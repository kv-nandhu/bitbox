import 'package:bitebox/function/address_function.dart';
import 'package:bitebox/function/addressedit.dart';
import 'package:bitebox/models/address_model.dart';
import 'package:bitebox/user/address/add_address.dart';
import 'package:bitebox/user/address/addressedit.dart';
import 'package:bitebox/user/orders_place/payment_screen.dart';
import 'package:flutter/material.dart';


class ViewAddress extends StatefulWidget {
  final int? total;
  const ViewAddress({ this.total, Key? key}) : super(key: key);

  @override
  State<ViewAddress> createState() => _ViewAddressState();
}

class _ViewAddressState extends State<ViewAddress> {
  //late SharedPreferences _prefs; // Declare SharedPreferences instance
  int? selectedAddressIndex;

  @override
  void initState() {
    super.initState();
    getaddress();
  }
  

  @override
  Widget build(BuildContext context) {
    // print(totals);
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    return Scaffold(
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
floatingActionButton: Padding(
  padding: const EdgeInsets.only(top: 10, bottom: 19),
  child: FloatingActionButton.extended(
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => AddAddressScreen()));
    },
    icon: Icon(Icons.add),
    label: Text("Add Address"),
    backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Set your desired background color here
  ),
),

      appBar: AppBar(
        elevation: 0,
       backgroundColor: Colors.redAccent.shade700,
        title: Text(
          'Choose Address',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        
        child: SizedBox(
          width: 600,
          child: ValueListenableBuilder(
            valueListenable: addresslist,
            builder: (context, List<Address> address, Widget? child) {
              return ListView.separated(
                itemCount: address.length,
                itemBuilder: (BuildContext context, int index) {
                  final addressadd = address.reversed.toList()[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Handle address tap
                          _handleRadioValueChange(index, addressadd);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 120,
                          width: double.infinity,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Radio(
                                value: index,
                                groupValue: selectedAddressIndex,
                                onChanged: (int? value) {
                                  // Handle Radio button change

                                  _handleRadioValueChange(value, addressadd);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    addressadd.usrname,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  
                                  Text(
                                    addressadd.number,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(addressadd.address),
                                  Text(addressadd.pincode),
                                ],
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => EditAddress(
                                                    name: addressadd.usrname,
                                                    contact: addressadd.number,
                                                    address: addressadd.address,
                                                    city: addressadd.city,
                                                    pincode: addressadd.pincode,
                                                    id: addressadd.id)));
                                      },
                                      icon: Icon(Icons.edit)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          removeaddress(context, addressadd.id);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  // You can customize the appearance of the separator here
                  return Divider(
                    height: 1,
                    color: Colors.grey,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // Update the Radio onChanged callback
  void _handleRadioValueChange(int? value, Address selectedAddress) {
    setState(() {
      selectedAddressIndex = value;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => PaymentScreen(address: selectedAddress, total: widget.total!,
                  
                  )));
    });
  }
}