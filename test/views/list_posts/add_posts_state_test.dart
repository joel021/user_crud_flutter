import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_crud_flutter/config/urls.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment_state.dart';

class MockClient extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  MockClient mockHttpClient;
  setUp(() {
    String resultFetchComments = """
[
  {
    "postId": 1,
    "id": 1,
    "name": "id labore ex et quam laborum",
    "email": "Eliseo@gardner.biz",
    "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
  },
  {
    "postId": 1,
    "id": 2,
    "name": "quo vero reiciendis velit similique earum",
    "email": "Jayne_Kuhic@sydney.com",
    "body": "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et"
  },
  {
    "postId": 1,
    "id": 3,
    "name": "odio adipisci rerum aut animi",
    "email": "Nikita@garfield.biz",
    "body": "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione"
  }]
""";

    mockHttpClient = MockClient();
    when(() =>
            mockHttpClient.get(Uri.parse("${URL.urlBase}/comments?postId=1")))
        .thenAnswer(((_) async {
      return Response(resultFetchComments, 200);
    }));
  });
  tearDown(() {});

  group('Add comment state tests', () {
    test('Fech all comments of a post, should return filled list', () async {
      AddCommentState addCommentState = AddCommentState();
      Post post = Post(1, 1, "post title", "body");
      addCommentState.fetchCommets(post);

      expect(() {
        assert(addCommentState.commentList.isEmpty);
      }, throwsAssertionError);
    });
  });
}
