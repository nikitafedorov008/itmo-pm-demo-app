import 'package:agromax/app.dart' show AgroMaxApp;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AgroMaxApp());

    // Verify that our counter starts at 0.
    expect(find.text('No upcoming meetings'), findsOneWidget);
    expect(find.text('Quick Access'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.cloud_outlined));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('Weather'), findsOneWidget);
  });
}