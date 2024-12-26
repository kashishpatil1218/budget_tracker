import 'dart:typed_data';

class UserModal {
  String? name, phone, email, age;
  Uint8List? img;

  UserModal(
      {required this.name,
      required this.email,
      required this.phone,
      required this.img,
      required this.age});

  factory UserModal.fromMap(Map m1) {
    return UserModal(
        name: m1['name'],
        email: m1['email'],
        phone: m1['phone'],
        img: m1['img'],
        age: m1['age']);
  }
}
