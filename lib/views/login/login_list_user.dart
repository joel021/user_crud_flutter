import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:user_crud_flutter/model/user.dart';

import 'package:user_crud_flutter/service/login_service.dart';


class AuthService {
  final UserService userService;

  AuthService(this.userService);

  Future<bool> authenticateUser(String username, String phone) async {
    try {
      Response response = await userService.getAllUsers();
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          List<dynamic> usersJson = jsonDecode(response.body);
          return isUserInJson(usersJson,username,phone);
          
        }
      } else {
        print('Erro ao obter usuários: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erro durante a autenticação: $e');
      return false;
    }

    return false;
  }
}

bool isUserInJson(List<dynamic> usersJson, String username, String phone) {
  for (var userJson in usersJson) {
    if (userJson['username'] == username && userJson['phone'] == phone) {
      return true;
    }
  }
  return false;
}
