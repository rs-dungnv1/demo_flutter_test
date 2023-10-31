import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.isEnable = true,
  });

  final IconData icon;
  final void Function() onTap;
  final bool? isEnable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ?? true ? onTap : null,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: isEnable ?? true ? Colors.orange : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
