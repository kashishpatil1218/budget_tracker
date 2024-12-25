import 'dart:typed_data';

class UserModel {
  final int id;
  final String firstName, lastName, email, password, phoneNumber;
  Uint8List? img;
  int? age;
  String? gender;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.age,
    this.gender,
    this.img,
  });

  factory UserModel.fromMap(Map map) => UserModel(
    id: map['id'] ,
    firstName: map['firstName'] ,
    lastName: map['lastName'] ,
    email: map['email'] ,
    password: map['password'] ,
    phoneNumber: map['phoneNumber'],
    age: map['age'],
    gender: map['gender'],
    img: map['profilePicture'],
  );
}