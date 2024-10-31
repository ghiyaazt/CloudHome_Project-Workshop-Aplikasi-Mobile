import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloudhome_application/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(AplikasiCuaca()); // Pastikan `AplikasiCuaca` didefinisikan

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Find and tap the '+' icon and trigger a frame.
    final Finder incrementButton = find.byIcon(Icons.add);
    expect(incrementButton, findsOneWidget); // Memastikan tombol '+' ada

    await tester.tap(incrementButton);
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
