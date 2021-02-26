import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      email: json['email'].toString(),
      firstName: json['first_name'].toString(),
      lastName: json['last_name'].toString(),
      avatar: json['avatar'].toString(),
    );
  }
}
