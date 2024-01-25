import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_crud_flutter/helper/user_helper.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/model/user.dart';
import 'package:user_crud_flutter/service/login_service.dart';
import 'package:user_crud_flutter/service/post_service.dart';

class ListPostsState extends ChangeNotifier {
  User? user;
  bool loading = false;
  String statusMessage = "";
  List<Post> postList = [];
  PostService postService = PostService();

  updateUser(User user) async {
    this.user = user;

    if (user.id == null) {
      loading = true;
      statusMessage = "Retrieving your personal informations.";
      UserService userService = UserService();
      userService
          .getAllUsers()
          .then((response) => onUserResponse(response))
          .onError((error, stackTrace) => onUserError());
    }
  }

  onUserError() async {
    loading = false;
    statusMessage = "Was not possible to retrieve your personal informations.";
    notifyListeners();
  }

  onUserResponse(Response response) async {
    loading = false;
    statusMessage = "";
    user = UserHelper().findUserByUserName(
        response.body as List<dynamic>, user?.username ?? "");
    notifyListeners();
  }

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
    postList = [];
    for (var postJson in postCollection) {
      postList.add(Post.fromJson(postJson));
    }
    loading = false;
    statusMessage = "Successfull";
    notifyListeners();
  }

  onFetchError(error, stackTrace) async {
    postList = [];
    loading = false;
    statusMessage = "Sorry, but was not possible to retrieve the data.";
    notifyListeners();
  }
}
