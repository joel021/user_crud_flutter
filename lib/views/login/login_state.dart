import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:user_crud_flutter/helper/user_helper.dart';
import 'package:user_crud_flutter/model/user.dart';

import 'package:user_crud_flutter/service/user_service.dart';

class LoginStateProvider extends ChangeNotifier {
  final UserService userService = UserService();
  User? user;
  bool loading = false;
  String message = "";

  authenticateUser(String username, String phone) async {
    loading = true;
    message = "Carregando";
    userService.getAllUsers().then(
        (response) => onRetrievedUsers(response, username, phone),
        onError: (error) => onError(error));
  }

  void onRetrievedUsers(
      Response response, String username, String phone) async {
    final List<dynamic> userJsonList = jsonDecode(response.body);

    User? userFound = UserHelper().findUserByUserName(userJsonList, username);

    if (userFound != null && identical(userFound.phone, phone)) {
      user = userFound;
    } else {
      message = "Usuário ou senha incorretos.";
    }

    loading = false;
    notifyListeners();
  }

  void onError(Response error) {
    loading = false;
    message = "Ocorreu um erro no sistema, tente novamente.";
    notifyListeners();
  }
}
