import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/cart_item_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/cart_summary_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Cart/cart_summary_item.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
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
                      spacerHeight(height: 25),
                      const PageTitle(title: 'سلة الشراء'),
                      spacerHeight(),
                      Expanded(
                        flex: 3,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartItemBox();
                          },
                          separatorBuilder: (context, index) => spacerHeight(),
                          itemCount: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              spacerHeight(height: 22),
              Expanded(
                flex: 2,
                child: CartSummaryBox(
                  items: [
                    CartSummaryItem(
                      itemTitle: 'الإجمالي',
                      itemAmount: '150\$',
                    ),
                    CartSummaryItem(
                      itemTitle: 'الحسم',
                      itemAmount: '10\$',
                      amountTextStyle: UITextStyle.medium.copyWith(
                        color: UIColors.white.withOpacity(0.5),
                      ),
                    ),
                    CartSummaryItem(
                      itemTitle: 'الصافي',
                      itemAmount: '140\$',
                    )
                  ],
                ),
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
                          onPressed: () {},
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
                          onPressed: () {},
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
