import 'package:hive_flutter/hive_flutter.dart';
part 'order_model.g.dart';

@HiveType(typeId: 9)
class Oredrplace {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String productName;
  @HiveField(2)
  String productPrice;
  @HiveField(3)
  String productabout;
  @HiveField(4)
  int productCount;
  @HiveField(5)
  int totalPrice;
  @HiveField(6)
  String deliveryAddress;
  @HiveField(7)
  String deliveryName;
  @HiveField(8)
  String deliveryPhone;
  @HiveField(9)
  String deliveryCity;
  @HiveField(10)
  String pincode;
  @HiveField(11)
  String productImage;
  @HiveField(12)
  int? status;
    @HiveField(13)
  String date;
      @HiveField(14)
  String? time;
  

  Oredrplace(
      {required this.id,
      required this.productName,
      required this.productPrice,
      required this.productabout,
      required this.productImage,
      required this.totalPrice,
      required this.productCount,
      required this.deliveryName,
      required this.deliveryPhone,
      required this.deliveryAddress,
      required this.deliveryCity,
      required this.pincode,
      required this.status,
       required this.date,
         required this.time,
       });
}