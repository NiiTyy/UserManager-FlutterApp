import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _loadedUsers = [];

  UserModel findUserById(int id) {
    return _loadedUsers.firstWhere((user) => user.id == id);
  }

  List<UserModel> get usersList {
    return [..._loadedUsers];
  }

  Future<List<UserModel>> fetchUsers() async {
    final url = 'https://reqres.in/api/users?per_page=12';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      final userData = (extractedData['data'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
      _loadedUsers = userData;
      notifyListeners();
      return userData;
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
}
