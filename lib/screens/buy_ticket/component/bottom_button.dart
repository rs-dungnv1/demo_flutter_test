import 'package:flutter/material.dart';

class BuyTicketButton extends StatelessWidget {
  const BuyTicketButton({
    super.key,
    required this.ontap,
    this.buttonKey,
    required this.label,
  });
  final VoidCallback? ontap;
  final Key? buttonKey;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: buttonKey,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // border radiu
        ),
      ),
      onPressed: ontap,
      child: Text(label),
    );
  }
}
