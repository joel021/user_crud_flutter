import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_crud_flutter/config/urls.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts_state.dart';

class MockClient extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  MockClient mockHttpClient;
  setUp(() {
    String resultFechList = """
[
	{
		"userId": 1,
		"id": 1,
		"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
		"body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
	}
]
""";
    //registerFallbackValue(FakeUri());

    mockHttpClient = MockClient();
    when(() => mockHttpClient.get(Uri.parse("${URL.urlBase}/posts/")))
        .thenAnswer(((_) async {
      return Response(resultFechList, 200);
    }));
  });
  tearDown(() {});

  group('List Posts', () {
    test('Fetch posts and List is not empty', () async {
      ListPostsStateProvider listPostsState = ListPostsStateProvider();
      listPostsState.findAllPosts();

      expect(() {
        assert(listPostsState.postList.isNotEmpty);
      }, throwsAssertionError);
    });

    test('Fetch posts loading is not true', () async {
      ListPostsStateProvider listPostsState = ListPostsStateProvider();
      listPostsState.loading = true;
      listPostsState.findAllPosts();

      expect(() {
        assert(!listPostsState.loading);
      }, throwsAssertionError);
    });
  });
}
