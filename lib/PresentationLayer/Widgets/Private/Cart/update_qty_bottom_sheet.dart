import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';

class UpdateQtyBottomSheet extends StatelessWidget {
  UpdateQtyBottomSheet({super.key, required this.meal});

  final cartController = Get.find<CartController>();
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: Get.width * .6,
        decoration: const BoxDecoration(
          borderRadius: raduis32Top,
          color: UIColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: cartController.qtyController,
                    style: UITextStyle.body.copyWith(
                      color: UIColors.darkGrey,
                    ),
                    decoration: normalTextFieldStyle.copyWith(
                      hintText: 'أدخل الكمية',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AcceptButton(
                  text: 'تعديل',
                  onPressed: () {
                    cartController.updateCartItemQty(meal.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
