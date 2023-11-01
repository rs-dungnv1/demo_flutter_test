import 'package:demo_flutter_test/screens/buy_ticket/buy_ticket_state_notifier.dart';
import 'package:demo_flutter_test/screens/buy_ticket/models/ticket.dart';
import 'package:demo_flutter_test/screens/list_ticket/components/item_ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListItemScreen extends ConsumerWidget {
  const ListItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(buyTicketProvider);
    final stateNotifier = ref.read(buyTicketProvider.notifier);

    final scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('List ticket'),
      ),
      body: ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        itemCount: state.listTicket.length,
        itemBuilder: (context, int index) {
          final itemTicket = state.listTicket[index];
          final isCombo = itemTicket.aTicketComboResponses != null;

          return ItemTicket(
            ticket: state.listTicket[index],
            salePrice:
                stateNotifier.getTotalPrice(itemTicket, isCombo: isCombo).first,
            originalPrice:
                stateNotifier.getTotalPrice(itemTicket, isCombo: isCombo).last,
            quantityDescription: _getQuantityDescription(
              itemTicket,
              adultQuantity: state.adults,
              childsQuantity: state.childs,
              oldersQuantity: state.olders,
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 12),
      ),
    );
  }

  String _getQuantityDescription(
    Ticket ticket, {
    required int adultQuantity,
    required int childsQuantity,
    required int oldersQuantity,
  }) {
    final isComboTicket =
        (ticket.aTicketComboResponses ?? <Map<String, dynamic>>[]).isNotEmpty;
    final desc = <String>[];

    if (isComboTicket) {
      final ticketType = ticket.aTicketComboResponses?[0];
      if (ticketType != null) {
        if (ticketType['adultQuantity'] != 0) {
          desc.add(
            '${ticketType['adultQuantity']} Người lớn',
          );
        }
        if (ticketType['childQuantity'] != 0) {
          desc.add(
            '${ticketType['childQuantity']} Trẻ em',
          );
        }
        if (ticketType['seniorQuantity'] != 0) {
          desc.add(
            '${ticketType['seniorQuantity']} Người lớn tuổi',
          );
        }
      }
    } else {
      if (adultQuantity != 0) {
        desc.add('$adultQuantity  Người lớn');
      }
      if (childsQuantity != 0) {
        desc.add('$childsQuantity Trẻ em');
      }
      if (oldersQuantity != 0) {
        desc.add('$oldersQuantity Người lớn tuổi');
      }
    }

    return desc.join(' + ');
  }
}
