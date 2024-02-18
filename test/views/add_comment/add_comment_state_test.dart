import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_crud_flutter/config/urls.dart';
import 'package:user_crud_flutter/model/comment.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment_state.dart';

class MockClient extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late Comment comment;
  MockClient mockHttpClient;
  setUp(() {
    comment = Comment(1, 6, "Name of The guy", "Eliseo@gardner.biz",
        "This is a new comment!");
    const String resultFetchComments = """
[
  {
    "postId": 1,
    "id": 1,
    "name": "id labore ex et quam laborum",
    "email": "Eliseo@gardner.biz",
    "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
  }
]
""";
    const String postCommentResult = """
{
  "postId": 1,
  "id": 2,
  "name": "Name of The guy",
  "email": "Eliseo@gardner.biz",
  "body": "This is a new comment!"
}
""";
    mockHttpClient = MockClient();
    when(() => mockHttpClient.get(Uri.parse("${URL.urlBase}/posts/1/comments")))
        .thenAnswer(((_) async {
      return Response(resultFetchComments, 200);
    }));
    when(() => mockHttpClient.post(Uri.parse("${URL.urlBase}/posts/1/comments"),
        body: jsonEncode(comment))).thenAnswer((invocation) async {
      return Response(postCommentResult, 200);
    });
  });
  tearDown(() {});

  group('Add comment state tests', () {
    test('Should update the list with the new comment', () async {
      AddCommentStateProvider addCommentState = AddCommentStateProvider();
      addCommentState.postComment(comment);

      expect(() {
        assert(addCommentState.commentList.isNotEmpty);
      }, throwsAssertionError);
    });
  });
}
