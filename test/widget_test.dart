// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_screen.dart';
import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_state_notifier.dart';
import 'package:demo_flutter_test/screens/list_ticket/list_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_flutter_test/main.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'unit_test.mocks.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('MyButton', () {
    late BuyTicketStateNotifier stateNotifier;
    late MockClient client;

    setUp(() {
      client = MockClient();
      stateNotifier = BuyTicketStateNotifier(client);
    });
    testWidgets('calls API on press', (WidgetTester tester) async {
      final mockClient = MockClient();
      when(mockClient.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
      )).thenAnswer(
        (_) async => http.Response(
          '''
           {
            "count": 1427,
            "entries": [
                        {
                          "API": "AdoptAPet",
                          "Description": "Resource to help get pets adopted",
                          "Auth": "apiKey",
                          "HTTPS": true,
                          "Cors": "yes",
                          "Link": "https://www.adoptapet.com/public/apis/pet_list.html",
                          "Category": "Animals"
                        },
                        {
                          "API": "Axolotl",
                          "Description": "Collection of axolotl pictures and facts",
                          "Auth": "",
                          "HTTPS": true,
                          "Cors": "no",
                          "Link": "https://theaxolotlapi.netlify.app/",
                          "Category": "Animals"
                        },
                        {
                          "API": "Cat Facts",
                          "Description": "Daily cat facts",
                          "Auth": "",
                          "HTTPS": true,
                          "Cors": "no",
                          "Link": "https://alexwohlbruck.github.io/cat-facts/",
                          "Category": "Animals" 
                        },
                      ]
            }
            ''',
          200,
        ),
      );

      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      expect(find.byKey(const ValueKey('button1')), findsOneWidget);
      final entrierButton = find.byKey(const ValueKey('button1'));

      await tester.tap(entrierButton);
      await tester.pump();

      expect(find.text('AdoptAPet'), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
    });
  });

  group('Test widget in setup ticket page', () {
    testWidgets('test find widget', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      expect(find.text('Get list Ticket'), findsNWidgets(1));

      final entrierButton = find.byKey(const Key('button1'));
      expect(find.byKey(const Key('button1')), findsOneWidget);
      await tester.tap(entrierButton);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });

  group('Test widget in list ticket page', () {
    testWidgets('Test find widget and scroll in list ticket page',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(
        routes: {
          BuyTicketScreen.routerName: (context) => const BuyTicketScreen(),
        },
        //navigatorObservers: [mockObserver],
        home: const BuyTicketScreen(),
      )));

      // find button get list ticket
      expect(find.text('Get list Ticket'), findsNWidgets(1));

      final getTicketButton = find.text('Get list Ticket');
      await tester.tap(getTicketButton);
      await tester.pump();
      expect(find.byWidget(const ListItemScreen()), findsOneWidget);
      expect(find.text('Setup ticket Paget'), findsNothing);

      //expect(find.byWidget(const Text('List ticket')), findsOneWidget);
    });
  });
}
