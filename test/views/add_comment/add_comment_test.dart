import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_crud_flutter/main.dart';

void main() {
  late MyApp myApp;

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    setUp(() async {
      myApp = const MyApp();
      await tester.pumpWidget(myApp);
      final userInput = find.ancestor(
        of: find.text('Usuário'),
        matching: find.byType(TextFormField),
      );

      await tester.enterText(userInput, "Bret");

      final phoneInput = find.ancestor(
        of: find.text('Phone'),
        matching: find.byType(TextFormField),
      );
      await tester.enterText(phoneInput, "1-770-736-8031 x56442");
    });

    expect(find.text("Próximo"), findsOneWidget);
  });
}
