import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:final_exam/main.dart';

void main() {
  testWidgets('Golden test for the UI', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      // const MaterialApp(
      //   home: 
        const MainApp(), // Replace with your widget
      // ),
    );

    // Take the screenshot and match with golden file
    await expectLater(
      find.byType(MaterialApp), // Replace with your widget type
      matchesGoldenFile('test/ui_sc.dart'),
    );
  });
}
