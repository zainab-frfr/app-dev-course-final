import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:final_exam/main.dart';

void main() {
  testWidgets('Golden test for the UI', (WidgetTester tester) async {
    await tester.pumpWidget(
        const MainApp(), 
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('test/ui_sc.dart'),
    );
  });
}
