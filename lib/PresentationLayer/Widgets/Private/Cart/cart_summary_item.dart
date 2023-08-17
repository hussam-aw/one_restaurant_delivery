import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class CartSummaryItem extends StatelessWidget {
  const CartSummaryItem({
    super.key,
    required this.itemTitle,
    required this.itemAmount,
    this.amountTextStyle = UITextStyle.medium,
  });

  final String itemTitle;
  final String itemAmount;
  final TextStyle? amountTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          itemTitle,
          style: UITextStyle.body.copyWith(
            color: UIColors.white.withOpacity(0.5),
          ),
        ),
        spacerHeight(height: 22),
        Text(
          itemAmount,
          style: amountTextStyle,
        ),
      ],
    );
  }
}
