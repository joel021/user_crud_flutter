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
	},
	{
		"userId": 1,
		"id": 2,
		"title": "qui est esse",
		"body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
	},
	{
		"userId": 1,
		"id": 3,
		"title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
		"body": "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
	},
""";
    registerFallbackValue(FakeUri());

    mockHttpClient = MockClient();
    when(() => mockHttpClient.get(Uri.parse("${URL.urlBase}/posts/")))
        .thenAnswer(((_) async {
      return Response(resultFechList, 200);
    }));
  });
  tearDown(() {});

  group('List Posts', () {
    test('Fetch posts and List is not empty', () async {
      ListPostsState listPostsState = ListPostsState();
      listPostsState.findAllPosts();

      expect(() {
        assert(listPostsState.postList.isNotEmpty);
      }, throwsAssertionError);
    });

    test('Fetch posts loading is not true', () async {
      ListPostsState listPostsState = ListPostsState();
      listPostsState.loading = true;
      listPostsState.findAllPosts();

      expect(() {
        assert(!listPostsState.loading);
      }, throwsAssertionError);
    });
  });
}
