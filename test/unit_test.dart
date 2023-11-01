import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_state_notifier.dart';
import 'package:demo_flutter_test/screens/buy_ticket/models/entries_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'unit_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('BuyTicketStateNotifierTestApi', () {
    late MockClient client;

    setUp(() {
      client = MockClient();
    });
    test(
      'given EntriesModel class when getListEntries function is called and status code is 200 then a EntriesModel should be returned',
      () async {
        BuyTicketStateNotifier stateNotifier = BuyTicketStateNotifier(client);
        when(
          client.get(
            Uri.parse('https://api.publicapis.org/entries'),
          ),
        ).thenAnswer(
          (_) async {
            return http.Response('''
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
            ''', 200);
          },
        );

        final listItem = await stateNotifier.getListEntries();
        expect(listItem, isA<List<EntriesModel>>());
        expect(stateNotifier.state.callApiDone, true);
      },
    );

    test(
      'throws an exception if the http call completes with an error',
      () async {
        BuyTicketStateNotifier stateNotifier = BuyTicketStateNotifier(client);
        when(
          client.get(
            Uri.parse('https://api.publicapis.org/entries'),
          ),
        ).thenAnswer(
          (_) async {
            return http.Response('Not Found', 402);
          },
        );
        await stateNotifier.getListEntries();
        expect(stateNotifier.state.isShowError, true);
      },
    );
  });
  group('BuyTicketStateNotifier', () {
    final client = MockClient();

    test('should update the olders amount', () {
      final stateNotifier = BuyTicketStateNotifier((client));
      stateNotifier.updateAmount(olders: 3);
      expect(stateNotifier.state.olders, 3);
    });

    test('should update the childs amount', () {
      final stateNotifier = BuyTicketStateNotifier((client));
      stateNotifier.updateAmount(childs: 2);
      expect(stateNotifier.state.childs, 2);
    });

    test('should update the adults amount', () {
      final stateNotifier = BuyTicketStateNotifier((client));
      stateNotifier.updateAmount(adults: 3);
      expect(stateNotifier.state.adults, 3);
    });

    test('totalAmount should be the sum of olders, childs, and adults', () {
      final stateNotifier = BuyTicketStateNotifier((client));
      stateNotifier.updateAmount(adults: 1, childs: 2, olders: 1);
      expect(stateNotifier.state.totalAmount, 4);
    });
  });

  group('BuyTicketStateNotifier check totalAmount', () {
    final client = MockClient();
    final stateNotifier = BuyTicketStateNotifier((client));
    test('should update the olders amount', () {
      stateNotifier.updateAmount(olders: 3);
      expect(stateNotifier.state.olders, 3);
    });

    test('should update the childs amount', () {
      stateNotifier.updateAmount(childs: 2);
      expect(stateNotifier.state.childs, 2);
    });

    test('should update the adults amount', () {
      stateNotifier.updateAmount(adults: 3);
      expect(stateNotifier.state.adults, 3);
    });

    test('totalAmount should be the sum of olders, childs, and adults', () {
      stateNotifier.updateAmount(adults: 1, childs: 2, olders: 1);
      expect(stateNotifier.state.totalAmount, 4);
    });
  });
}
