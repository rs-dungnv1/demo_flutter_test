import 'package:demo_flutter_test/screens/buy_ticket/models/entries_model.dart';
import 'package:demo_flutter_test/utils.dart';
import 'package:flutter/material.dart';

class ItemEntries extends StatelessWidget with Utils {
  const ItemEntries({
    Key? key,
    required this.entriesModel,
  }) : super(key: key);
  final EntriesModel entriesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue, // Change the color of the Container
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12), // Set the border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          infoTicket(),
          const SizedBox(
            height: 10,
          ),
          Text(entriesModel.description ?? ''),
        ],
      ),
    );
  }

  Widget infoTicket() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(entriesModel.api ?? ''),
        Text(entriesModel.category ?? ''),
      ],
    );
  }
}
