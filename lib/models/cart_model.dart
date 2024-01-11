import 'package:hive_flutter/hive_flutter.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 6)
class Cart extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? prize;

  @HiveField(2)
  String? image;

  @HiveField(3)
  int? count;


  @HiveField(4)
  int? id;

  @HiveField(5)
  String? category;

    @HiveField(6)
  String? about;

    @HiveField(7)
  String? unit;
  
  
  Cart(
      {required this.name,
      required this.image,
      required this.prize,
      required this.category,
      required this.about,
        required this.count,
        required this.unit,
      this.id});
}