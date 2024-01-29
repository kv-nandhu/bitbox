// ignore: file_names
import 'package:hive/hive.dart';

part 'user_login.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
    String email;

 @HiveField(1)
    String name;

 @HiveField(2)
    String number;

 @HiveField(3)
    String password;
    
 @HiveField(4)
    String image;

 @HiveField(5)
    int ? id;
  User(
    {required this.email,
    required this.name,
    required this.number,
    required this.password,
    required this.image,
       required this.id}
  );
}