import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/order.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class OrderBox extends StatelessWidget {
  const OrderBox({super.key, required this.order, this.editOnPressed});

  final Order order;
  final Function()? editOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: UIColors.lightDeepBlue,
        borderRadius: raduis20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 67,
              decoration: const BoxDecoration(
                color: UIColors.red,
                borderRadius: raduis20,
              ),
              child: Center(
                child: Text(
                  '#${order.id}',
                  softWrap: true,
                  style: UITextStyle.heading,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'حالة الطلب: قيد التوصيل',
                    style: UITextStyle.body,
                  ),
                  spacerHeight(height: 12),
                  Text(
                    'اجمالي المبلغ: ${order.total}',
                    style: UITextStyle.xsmall,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: editOnPressed,
              icon: const Icon(
                FontAwesomeIcons.solidPenToSquare,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
