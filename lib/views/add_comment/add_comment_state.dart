import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/service/comment_service.dart';

import '../../model/comment.dart';

class AddCommentStateProvider extends ChangeNotifier {
  List<Comment> commentList = [];
  CommentService commentService = CommentService();

  void updateComments(Post? post) {
    if (post?.id != null) {
      fetchCommets(post?.id ?? 0);
    }
  }

  void fetchCommets(int postId) async {
    commentService
        .getComments(postId)
        .then((response) => onRetrieveCommentsResult(response))
        .onError((error, stackTrace) => null);
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

  void postComment(Comment comment) async {
    commentService
        .postComment(comment)
        .then((response) => onAddComment(comment))
        .onError((error, stackTrace) => onPostCommentError());
  }

  void onPostCommentError() {}

  void onAddComment(Comment comment) async {
    if (commentList.isEmpty) {
      fetchCommets(comment.postId);
    } else {
      commentList.add(comment);
      notifyListeners();
    }
  }
}
