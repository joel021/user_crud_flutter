import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:user_crud_flutter/model/post.dart';

import '../config/urls.dart';

class PostService {
  final String path = "/posts";

  Future<Response> postPost(Post post) async {
    return http.post(Uri.parse(URL.urlBase + path), body: jsonEncode(post));
  }

  Future<Response> getAllPost() {
    return http.get(Uri.parse(URL.urlBase + path));
  }
}
