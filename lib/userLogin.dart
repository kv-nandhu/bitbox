// ignore: file_names
import 'package:hive/hive.dart';

part 'userLogin.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
   late String email;

 @HiveField(1)
   late String name;

 @HiveField(2)
   late String number;

 @HiveField(3)
   late String password;

  User(
    {required this.email,
    required this.name,
    required this.number,
    required this.password}
  );
}