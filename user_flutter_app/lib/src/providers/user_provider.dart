import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _loadedUsers = [
    // UserModel(
    //   id: '1',
    //   email: 'niti1@gmail.com',
    //   firstName: 'Arjanit1',
    //   lastName: 'Kotorri1',
    //   avatar: 'https://reqres.in/img/faces/1-image.jpg',
    // ),
    // UserModel(
    //   id: '2',
    //   email: 'niti2@gmail.com',
    //   firstName: 'Arjanit2',
    //   lastName: 'Kotorri2',
    //   avatar: 'https://reqres.in/img/faces/1-image.jpg',
    // ),
    // UserModel(
    //   id: '3',
    //   email: 'niti3@gmail.com',
    //   firstName: 'Arjanit3',
    //   lastName: 'Kotorri3',
    //   avatar: 'https://reqres.in/img/faces/1-image.jpg',
    // ),
  ];

  UserModel findUserById(String id) {
    return _loadedUsers.firstWhere((user) => user.id == id);
  }

  List<UserModel> get usersList {
    return [..._loadedUsers];
  }

  // UserModel nextUser(String id) {
  //   // id += 1;
  //   return _loadedUsers.indexOf(element).
  // }

  Future<UserModel> fetchUsers() async {
    final url = 'https://reqres.in/api/users?per_page=12';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      final userData = (extractedData['data'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
      _loadedUsers = userData;
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
}
