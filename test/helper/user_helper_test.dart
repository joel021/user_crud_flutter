import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:user_crud_flutter/helper/user_helper.dart';
import 'package:user_crud_flutter/model/user.dart';

void main() {
  late List<dynamic> userList;
  setUp(() {
    userList = jsonDecode("""
[
  {
    "id": 2,
    "name": "Ervin Howell",
    "username": "Antonette",
    "email": "Shanna@melissa.tv",
    "address": {
      "street": "Victor Plains",
      "suite": "Suite 879",
      "city": "Wisokyburgh",
      "zipcode": "90566-7771",
      "geo": {
        "lat": "-43.9509",
        "lng": "-34.4618"
      }
    },
    "phone": "010-692-6593 x09125",
    "website": "anastasia.net",
    "company": {
      "name": "Deckow-Crist",
      "catchPhrase": "Proactive didactic contingency",
      "bs": "synergize scalable supply-chains"
    }
  }
  ]
""");
  });
  tearDown(() {});

  group('Find by username', () {
    test('User existent is not null.', () async {
      UserHelper userHelper = UserHelper();
      User? user = userHelper.findUserByUserName(userList, "Antonette");
      expect(() {
        assert(user != Null);
      }, throwsAssertionError);
    });

    test('User not existent, return null.', () async {
      UserHelper userHelper = UserHelper();
      User? user = userHelper.findUserByUserName(userList, "Antonette hahah");
      expect(() {
        assert(user == Null);
      }, throwsAssertionError);
    });
  });
}
