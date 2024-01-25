import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../config/urls.dart';

class UserService {
  final String path = "/users";

  Future<Response> getAllUsers() {
    return http.get(Uri.parse(URL.urlBase + path));
  }
}