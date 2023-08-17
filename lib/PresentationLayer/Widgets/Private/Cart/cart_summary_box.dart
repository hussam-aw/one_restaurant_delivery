import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/cart_summary_item.dart';

class CartSummaryBox extends StatelessWidget {
  const CartSummaryBox({super.key, required this.items});

  final List<CartSummaryItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      color: UIColors.lightDeepBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      ),
    );
  }
}
