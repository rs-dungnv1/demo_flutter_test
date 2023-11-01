// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_screen.dart';
import 'package:demo_flutter_test/screens/list_ticket/list_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_flutter_test/main.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Test widget in setup ticket page', () {
    testWidgets('test find widget', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      expect(find.text('Get list Ticket'), findsNWidgets(1));

      final entrierButton = find.byKey(const Key('button1'));

      expect(find.byKey(const Key('button1')), findsOneWidget);

      expect(find.byIcon(Icons.add), findsNWidgets(3));

      expect(find.byIcon(Icons.remove), findsNWidgets(3));

      expect(find.byType(CircularProgressIndicator), findsNothing);

      await tester.tap(entrierButton);

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();
    });
  });

  group('Test widget in list ticket page', () {
    testWidgets('Test find widget and scroll in list ticket page',
        (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(
        routes: {
          BuyTicketScreen.routerName: (context) => const BuyTicketScreen(),
        },
        home: const BuyTicketScreen(),
      )));

      // find button get list ticket
      expect(find.text('Get list Ticket'), findsNWidgets(1));

      final getTicketButton = find.text('Get list Ticket');
      await tester.tap(getTicketButton);
      await tester.pump();
      expect(find.byWidget(const ListItemScreen()), findsOneWidget);
      expect(find.text('Setup ticket Paget'), findsNothing);
    });
  });
}
