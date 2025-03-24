import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_database/main.dart';
import 'package:moor_database/data/database.dart';

void main() {
  testWidgets('Basic app load test', (WidgetTester tester) async {
    final db = AppDatabase(); // Create the database instance

    // Pump the app with the required db parameter
    await tester.pumpWidget(MyApp(db: db));

    // You can now test for your UI elements
    expect(
        find.text('Moor Notes'), findsOneWidget); // for AppBar title, if used
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
