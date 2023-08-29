import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/apply_coupon_bottom_sheet.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/cart_item_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/cart_summary_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/cart_summary_item.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/send_order_bottom_sheet.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

import '../Widgets/Public/ord_drawer.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({super.key});

  final cartController = Get.put(CartController());
  final mealsController = Get.find<MealsController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: const OrdDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const PageTitle(title: 'سلة الشراء'),
                      spacerHeight(),
                      Expanded(
                        flex: 3,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartItemBox(
                              cartItem: cartController.cartItems[index],
                              meal: mealsController.getMealFromId(
                                  cartController.cartItems[index].mealId)!,
                            );
                          },
                          separatorBuilder: (context, index) => spacerHeight(),
                          itemCount: cartController.cartItems.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              spacerHeight(height: 22),
              Expanded(
                flex: 2,
                child: GetBuilder<CartController>(
                    init: cartController,
                    builder: (_) {
                      return CartSummaryBox(
                        items: [
                          CartSummaryItem(
                            itemTitle: 'الإجمالي',
                            itemAmount: '${cartController.totalAmount}\$',
                          ),
                          CartSummaryItem(
                            itemTitle: 'الحسم',
                            itemAmount: '${cartController.discountAmount}\$',
                            amountTextStyle: UITextStyle.medium.copyWith(
                              color: UIColors.white.withOpacity(0.5),
                            ),
                          ),
                          CartSummaryItem(
                            itemTitle: 'الصافي',
                            itemAmount: '${cartController.netAmount}\$',
                          )
                        ],
                      );
                    }),
              ),
              spacerHeight(height: 22),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: AcceptButton(
                          onPressed: () {
                            Get.bottomSheet(
                              ApplyCouponBottomSheet(),
                            );
                          },
                          backgroundColor: UIColors.white,
                          textStyle: UITextStyle.medium.copyWith(
                            color: UIColors.red,
                          ),
                          text: 'تطبيق كود حسم',
                        ),
                      ),
                      spacerHeight(),
                      Expanded(
                        child: AcceptButton(
                          onPressed: () {
                            Get.bottomSheet(
                              SendOrderBottomSheet(),
                            );
                          },
                          text: 'إرسال الطلب',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
