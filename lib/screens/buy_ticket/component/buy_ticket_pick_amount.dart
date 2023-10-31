import 'package:demo_flutter_test/screens/buy_ticket/component/action_button.dart';
import 'package:demo_flutter_test/screens/buy_ticket/component/buy_ticket_item.dart';
import 'package:flutter/material.dart';

class BuyTicketPickAmount extends StatelessWidget {
  const BuyTicketPickAmount({
    super.key,
    required this.title,
    required this.description,
    required this.amount,
    required this.onTapIncrement,
    required this.onTapDecrement,
  });

  final String title;
  final String description;
  final int amount;
  final void Function() onTapIncrement;
  final void Function() onTapDecrement;

  @override
  Widget build(BuildContext context) {
    final isEnable = amount > 0;

    return BuyTicketItem(
      title: title,
      description: Text(
        description,
      ),
      content: SizedBox(
        width: 90,
        child: Row(
          children: [
            ActionButton(
              icon: Icons.remove,
              onTap: onTapDecrement,
              isEnable: isEnable,
            ),
            Expanded(
              child: Center(
                child: Text(
                  '$amount',
                ),
              ),
            ),
            ActionButton(
              icon: Icons.add,
              onTap: onTapIncrement,
            ),
          ],
        ),
      ),
    );
  }
}
