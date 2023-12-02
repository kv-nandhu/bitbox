// ignore: file_names
import 'package:hive/hive.dart';
// part 'user_product.g.dart';
part 'user_product.g.dart'; 

@HiveType(typeId:4)
class Addproducts extends HiveObject {
  @HiveField(0)
  String? name;

 @HiveField(1)
   String? prize;

    @HiveField(2)
   String? image;

   @HiveField(3)
   String? about;

   @HiveField(4)
   String? category;

   @HiveField(5)
   String? unit;

  @HiveField(6)
  int? id;

  Addproducts(
    {
    required this.name,
     required this.prize,
      required this.image,
         required this.about,
            required this.category,
              required this.unit,
                required this.id,
    
    
   }
  );
}