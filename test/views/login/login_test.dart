import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_crud_flutter/config/urls.dart';
import 'package:user_crud_flutter/views/login/login_state.dart';

class MockClient extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  MockClient mockHttpClient;
  setUp(() {
    String usersJsonBody = """
[
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  }
]
""";

    mockHttpClient = MockClient();
    when(() => mockHttpClient.get(Uri.parse("${URL.urlBase}/users")))
        .thenAnswer(((_) async {
      return Response(usersJsonBody, 200);
    }));
  });
  tearDown(() {});

  group('LoginStateProvider', () {
    test('Final state after complete valid authentication', () async {
      LoginStateProvider loginStateProvider = LoginStateProvider();
      loginStateProvider.authenticateUser("Bret", "1-770-736-8031 x56442");
      expect(() {
        assert(loginStateProvider.user != null);
      }, throwsAssertionError);
    });
  });
}
