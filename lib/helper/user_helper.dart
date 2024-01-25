import 'package:user_crud_flutter/model/user.dart';

class UserHelper {
  User? findUserByUserName(List<dynamic> userList, String username) {
    for (dynamic userDynamic in userList) {
      User user = User.fromJson(userDynamic);
      if (identical(username, user.username)) {
        return user;
      }
    }
    return null;
  }
}
