import 'dart:convert';

import 'package:http/http.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/service/post_service.dart';

class ListPostsState {
  bool loading = false;
  String error = "";
  List<Post> postList = List.empty();
  PostService postService = PostService();

  findAllPosts() {
    loading = true;

    postService
        .getAllPost()
        .then((response) => onFetchSuccess(response))
        .onError((error, stackTrace) => onFetchError(error, stackTrace));
  }

  onFetchSuccess(Response response) {
    final postCollection = jsonDecode(response.body);

    for (var postJson in postCollection.values) {
      postList.add(Post.fromJson(postJson));
    }
    loading = false;
  }

  onFetchError(error, stackTrace) {
    loading = false;
    error = "Sorry, but was not possible to retrieve the data.";
  }
}
