// ignore_for_file: omit_local_variable_types

import 'dart:developer';

import 'package:demo_flutter_test/api/api_exception.dart';

import 'package:demo_flutter_test/core/constants.dart';
import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_state.dart';
import 'package:demo_flutter_test/screens/buy_ticket/models/entries_model.dart';
import 'package:demo_flutter_test/screens/buy_ticket/models/ticket.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final http.Client client = http.Client();
final buyTicketProvider =
    StateNotifierProvider.autoDispose<BuyTicketStateNotifier, BuyTicketState>(
        (_) {
  return BuyTicketStateNotifier(client);
});

class BuyTicketStateNotifier extends StateNotifier<BuyTicketState> {
  BuyTicketStateNotifier(this.client) : super(BuyTicketState()) {}
  final http.Client client;

  List<Map<String, dynamic>>? listPrice;
  List<Map<String, dynamic>>? listComboPrice;
  int tsCallApi = 0;
  int soldQuantity = 0;

  Future<void> getListEntries() async {
    state = state.copyWith(
      showLoadingIndicator: true,
    );
    try {
      final uri = Uri.parse('https://api.publicapis.org/entries');
      final result = await client.get(uri);

      if (result.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(result.body) as Map<String, dynamic>;
        final entriesResponse = (jsonResponse['entries'] as List<dynamic>?)
            ?.map((e) => EntriesModel.fromMap(Map<String, dynamic>.from(e)))
            .toList();

        state = state.copyWith(listEntriesModel: entriesResponse ?? []);
      }
      state = state.copyWith(
        showLoadingIndicator: false,
      );
    } on APIErrors catch (e) {
      state = state.copyWith(
        showLoadingIndicator: false,
      );
      return;
    } catch (e) {
      log('$e');
      state = state.copyWith(
        showLoadingIndicator: false,
      );
      return;
    }
  }

  void sortTicket() {
    state = state.copyWith(showShimmer: true, listTicket: listTicketDemo);
    final result = <Ticket>[];
    final listTicket = state.listTicket;
    // List vé combo phù hợp
    final listTicketCombo = listTicket
        .where(
          (e) =>
              (e.aTicketComboResponses ?? <Map<String, dynamic>>[]).isNotEmpty,
        )
        .toList();
    final listTicketComboFirst = listTicketCombo.where((element) {
      final adultQuantity = element.aTicketComboResponses![0]['adultQuantity'];
      final childQuantity = element.aTicketComboResponses![0]['childQuantity'];
      final seniorQuantity =
          element.aTicketComboResponses![0]['seniorQuantity'];

      // số lượng adults phải thoả mãn điều kiện SL adults mong muốn chia hết cho Sl adults của vé
      if (state.adults % adultQuantity != 0) {
        return false;
      }
      // số lượng childs phải thoả mãn điều kiện SL childs mong muốn chia hết cho Sl childs của vé

      if ((childQuantity == 0 && state.childs != 0) ||
          (childQuantity != 0 && state.childs == 0) ||
          (childQuantity != 0 && state.childs % childQuantity != 0)) {
        return false;
      }
      // số lượng childs phải thoả mãn điều kiện SL childs mong muốn chia hết cho Sl childs của vé
      if ((seniorQuantity == 0 && state.olders != 0) ||
          (seniorQuantity != 0 && state.olders == 0) ||
          (seniorQuantity != 0 && state.olders % seniorQuantity != 0)) {
        return false;
      }
      return true;
    }).toList()
      ..sort((a, b) {
        final priceA = getTotalPrice(a, isCombo: true).first;
        final priceB = getTotalPrice(b, isCombo: true).first;

        return priceA.compareTo(priceB);
      });

    //list vé combo không phù hợp
    final listTicketComboOther = [...listTicketCombo];

    for (final element in listTicketComboFirst) {
      listTicketComboOther.remove(element);
    }

    //list vé thường
    final listTicketOriginal = listTicket
        .where(
          (e) => e.aTicketItemResponses != null,
        )
        .toList();

    //List mix bao gồm vé thường và vé combo không phù hợp được sắp xếp theo giá từ thấp đến cao
    final listMix = <Ticket>[...listTicketOriginal, ...listTicketComboOther]
      ..sort((a, b) {
        final priceA = getTotalPrice(a,
                isCombo: ((a.aTicketComboResponses ?? <Map<String, dynamic>>[])
                    .isNotEmpty))
            .first;
        final priceB = getTotalPrice(b,
                isCombo: ((a.aTicketComboResponses ?? <Map<String, dynamic>>[])
                    .isNotEmpty))
            .first;

        return priceA.compareTo(priceB);
      });

    //list vé sold out
    final listTicketUnavailable = listTicket
        .where(
          (e) =>
              e.aTicketItemResponses == null && e.aTicketComboResponses == null,
        )
        .toList();

    result
      ..addAll(listTicketComboFirst)
      ..addAll(listMix)
      ..addAll(listTicketUnavailable);

    state = state.copyWith(listTicket: result, showShimmer: false);
  }

  void updateAmount({int? olders, int? childs, int? adults}) async {
    if (olders != null) {
      state = state.copyWith(olders: olders);
    } else if (childs != null) {
      state = state.copyWith(childs: childs);
    } else if (adults != null) {
      state = state.copyWith(adults: adults);
    }
    final total = state.adults + state.childs + state.olders;
    state = state.copyWith(totalAmount: total);
  }

  List<double> getTotalPrice(
    Ticket ticket, {
    bool isCombo = false,
  }) {
    final result = <double>[];
    double originalPrice = 0;
    double salePrice = 0;
    if ((ticket.aTicketComboResponses ?? <Map<String, dynamic>>[]).isNotEmpty) {
      final ticketType = ticket.aTicketComboResponses?[0];

      if (ticketType != null) {
        originalPrice = originalPrice +
            ticketType['comboQuantity'] * ticketType['originalPrice'];
        salePrice =
            salePrice + ticketType['comboQuantity'] * ticketType['salePrice'];
      }
    } else {
      ticket.aTicketItemResponses?.forEach((element) {
        if (element['objectTypeCode'] == Constants.adultsCode) {
          originalPrice =
              originalPrice + state.adults * element['originalPrice'];
          salePrice = salePrice + state.adults * element['salePrice'];
        }
        if (element['objectTypeCode'] == Constants.childsCode) {
          originalPrice =
              originalPrice + state.childs * element['originalPrice'];
          salePrice = salePrice + state.childs * element['salePrice'];
        }
        if (element['objectTypeCode'] == Constants.oldersCode) {
          originalPrice =
              originalPrice + state.olders * element['originalPrice'];
          salePrice = salePrice + state.olders * element['salePrice'];
        }
      });
    }

    result
      ..add(salePrice)
      ..add(originalPrice);

    return result;
  }

  void setShowText() {
    state = state.copyWith(setShowText: !state.setShowText);
  }

  Future<void> setloading() async {
    state = state.copyWith(showLoadingIndicator: true);
    await Future.delayed(const Duration(seconds: 3));
    state = state.copyWith(showLoadingIndicator: false);
  }
}
