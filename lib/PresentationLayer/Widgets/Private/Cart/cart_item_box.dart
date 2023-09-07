import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/cart_item.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/update_qty_bottom_sheet.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class CartItemBox extends StatelessWidget {
  CartItemBox({super.key, required this.cartItem, required this.meal});

  final CartItem cartItem;
  final Meal meal;
  final cartController = Get.find<CartController>();

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
              height: 70,
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
              padding: const EdgeInsets.symmetric(horizontal: 14),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.bottomSheet(UpdateQtyBottomSheet(meal: meal));
                  },
                  child: const Icon(
                    FontAwesomeIcons.solidPenToSquare,
                    size: 22,
                  ),
                ),
                spacerHeight(),
                InkWell(
                  onTap: () {
                    cartController.removeFromCart(meal.id);
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
