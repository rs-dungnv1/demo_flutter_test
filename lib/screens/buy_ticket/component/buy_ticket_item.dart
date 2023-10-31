import 'package:flutter/material.dart';

class BuyTicketItem extends StatelessWidget {
  const BuyTicketItem({
    super.key,
    required this.title,
    required this.content,
    this.description,
    this.iconHeight,
    this.iconWidth,
    this.ontap,
    this.titleWidget,
    this.isDescCenter = false,
    this.padding,
  });

  final String title;
  final Widget content;
  final Widget? description;
  final double? iconHeight;
  final double? iconWidth;
  final VoidCallback? ontap;
  final bool isDescCenter;
  final Widget? titleWidget;

  final double? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: isDescCenter
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleWidget ??
                          Text(
                            title,
                            //style: AppStyles.bodyRegular.grey700Color,
                          ),
                      const SizedBox(width: 8),
                      content,
                    ],
                  ),
                  description ?? const SizedBox.shrink(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
