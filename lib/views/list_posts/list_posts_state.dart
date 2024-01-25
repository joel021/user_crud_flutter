import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/service/post_service.dart';

class ListPostsState extends ChangeNotifier {
  bool loading = false;
  String statusMessage = "";
  List<Post> postList = [];
  PostService postService = PostService();

  findAllPosts() async {
    loading = true;
    statusMessage = "loading ...";
    postService
        .getAllPost()
        .then((response) => onFetchSuccess(response))
        .onError((error, stackTrace) => onFetchError(error, stackTrace));
  }

  onFetchSuccess(Response response) async {
    final postCollection = jsonDecode(response.body);

    for (var postJson in postCollection) {
      postList.add(Post.fromJson(postJson));
    }
    loading = false;
    statusMessage = "Successfull";
    notifyListeners();
  }

  onFetchError(error, stackTrace) async {
    loading = false;
    statusMessage = "Sorry, but was not possible to retrieve the data.";
    notifyListeners();
  }
}
