import 'package:flutter/material.dart';
import 'package:flutter_learn_377/test_for_counter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test on isolation
  testWidgets('given counter is 0 when increment button is clicked then counter should be 1.',
          (widgetTester) async {
            await widgetTester.pumpWidget(const MaterialApp(home: MyHomePage()));

            final ctr = find.text('0');
            expect(ctr, findsOneWidget);

            final fab = find.byType(FloatingActionButton);
            await widgetTester.tap(fab);
            await widgetTester.pump();

            final ctr1 = find.text('1');
            expect(ctr1, findsOneWidget);

          },
  );
}