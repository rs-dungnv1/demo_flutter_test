import 'package:demo_flutter_test/screens/buy_ticket/models/ticket.dart';
import 'package:demo_flutter_test/utils.dart';
import 'package:flutter/material.dart';

class ItemTicket extends StatelessWidget with Utils {
  const ItemTicket({
    Key? key,
    required this.ticket,
    required this.originalPrice,
    required this.salePrice,
    required this.quantityDescription,
  }) : super(key: key);
  final Ticket ticket;
  final double originalPrice;
  final double salePrice;
  final String quantityDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          infoTicket(),
          const SizedBox(
            height: 10,
          ),
          Text(quantityDescription),
        ],
      ),
    );
  }

  Widget infoTicket() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(ticket.ticketName ?? ''),
        Text(formatCurrencyEx(
          salePrice,
        )),
      ],
    );
  }
}
