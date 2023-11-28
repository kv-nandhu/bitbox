import 'package:hive/hive.dart';

part '../function/user_favorite.g.dart';

@HiveType(typeId: 3)
class Addfavorite extends HiveObject {
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
  int? id;

  Addfavorite(
    {
    required this.name,
     required this.prize,
      required this.image,
         required this.about,
            required this.category,
                required this.id,
    
    
   }
  );
}