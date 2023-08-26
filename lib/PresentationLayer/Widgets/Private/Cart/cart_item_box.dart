import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/cart_item.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class CartItemBox extends StatelessWidget {
  const CartItemBox({super.key, required this.cartItem, required this.meal});

  final CartItem cartItem;
  final Meal meal;

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
                color: UIColors.lightGrey,
                borderRadius: raduis20,
              ),
              child: OrdImageContainer(
                imagePath: meal.image,
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
                  Text(
                    meal.name,
                    style: UITextStyle.body,
                  ),
                  spacerHeight(height: 12),
                  RichText(
                    text: TextSpan(
                      style: UITextStyle.xsmall,
                      children: [
                        TextSpan(text: 'العدد: ${cartItem.qty}'),
                        const TextSpan(text: ' - '),
                        TextSpan(text: 'الافرادي: ${meal.price}'),
                        const TextSpan(text: ' - '),
                        TextSpan(
                            text: 'الاجمالي: ${meal.price * cartItem.qty}\$'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
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
