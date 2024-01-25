import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:user_crud_flutter/config/urls.dart';
import 'package:user_crud_flutter/model/comment.dart';

class CommentService {
  final String path = "/comments";

  Future<Response> getComments(int postId) {
    return http.get(Uri.parse("${URL.urlBase + path}?postId=$postId"));
  }

  Future<Response> postComment(Comment comment) {
    return http.post(Uri.parse(URL.urlBase + path), body: jsonEncode(comment));
  }
}
