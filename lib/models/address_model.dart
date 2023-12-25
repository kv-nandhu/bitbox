import 'package:hive/hive.dart';

part 'address_model.g.dart'; 

@HiveType(typeId: 5)
class Address {
  @HiveField(0)
  String usrname;

  @HiveField(1)
  String address;

  @HiveField(2)
  String city;

  @HiveField(3)
  String pincode;

  @HiveField(4)
  int id;

  @HiveField(5)
  String number;


  Address({
 
    required this.address,
    required this.city,
    required this.pincode,
    required this.usrname,
    required this.number,
    required this.id,
  });
}