// ignore: file_names
import 'package:hive/hive.dart';
part 'user_product.g.dart';


@HiveType(typeId: 2)
class Addproducts extends HiveObject {
  @HiveField(0)
  

 @HiveField(1)
   late String name;

    @HiveField(2)
   late String prize;

   @HiveField(3)
   late String image;




  @HiveField(5)
  int? id;


  Addproducts(
    {
    required this.name,
     required this.prize,
      required this.image,
    
   }
  );
}