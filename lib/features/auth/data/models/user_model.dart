import 'package:test_flutter/features/auth/domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({required String id, required String name, required String email})
    : super(id: id, name: name, email: email);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'email': email};
}
