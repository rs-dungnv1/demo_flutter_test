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
    late BuyTicketStateNotifier stateNotifier;
    late MockClient client;

    setUp(() {
      client = MockClient();
      stateNotifier = BuyTicketStateNotifier(client);
    });
    test(
      'given EntriesModel class when getListEntries function is called and status code is 200 then a EntriesModel should be returned',
      () async {
        when(
          client.get(
            Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
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
                      ]
            }
            ''', 200);
          },
        );

        await stateNotifier.getListEntries();
        // Assert
        expect(stateNotifier.state.listEntriesModel, isA<List<EntriesModel>>());
      },
    );
  });
  group('BuyTicketStateNotifier', () {
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
      stateNotifier.updateAmount(adults: 1, childs: 1, olders: 2);
      expect(stateNotifier.state.totalAmount, 4);
    });
  });
}
