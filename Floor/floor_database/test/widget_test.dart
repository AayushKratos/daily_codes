import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:floor_database/main.dart';
import 'package:floor_database/database/db.dart'; // adjust path as needed

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Initialize the database (in-memory for testing)
    final database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(database: database));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
