import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/service/comment_service.dart';

import '../../model/comment.dart';

class AddCommentState extends ChangeNotifier {
  List<Comment> commentList = [];
  CommentService commentService = CommentService();
  Post? post;

  void updateComments(Post? post) {
    if (commentList.isEmpty) {
      fetchCommets(post);
    }
  }

  void fetchCommets(Post? post) async {
    if (post?.id != null) {
      this.post = post;
      commentService
          .getComments(post?.id ?? 0)
          .then((response) => onRetrieveCommentsResult(response))
          .onError((error, stackTrace) => null);
    }
  }

  void onRetrieveCommentsResult(Response response) async {
    final List<dynamic> listDynamicPost = jsonDecode(response.body);
    commentList = [];
    for (dynamic postJson in listDynamicPost) {
      commentList.add(Comment.fromJson(postJson));
    }

    notifyListeners();
  }

  void onRetrieveCommentsError() async {
    commentList = [];
    notifyListeners();
  }

  void addComment(Comment comment) async {
    commentService
        .postComment(comment)
        .then((value) => null)
        .onError((error, stackTrace) => null);
  }

  void onAddComment(Response response) async {
    fetchCommets(post);
  }
}
