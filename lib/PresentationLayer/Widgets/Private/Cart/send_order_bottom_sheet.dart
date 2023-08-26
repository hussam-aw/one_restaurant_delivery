import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

class SendOrderBottomSheet extends StatelessWidget {
  const SendOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * .6,
      decoration: const BoxDecoration(
        borderRadius: raduis32Top,
        color: UIColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: Column(
          children: [
            Text(
              'إرسال الطلب',
              style: UITextStyle.heading.copyWith(
                color: UIColors.lightDeepBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            spacerWidth(width: 25),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text(
                      'العنوان الحالي',
                      style: UITextStyle.title.copyWith(
                        color: UIColors.darkGrey,
                      ),
                    ),
                  ),
                  spacerHeight(height: 22),
                  InkWell(
                    child: Text(
                      'المكتب',
                      style: UITextStyle.title.copyWith(
                        color: UIColors.darkGrey,
                      ),
                    ),
                  ),
                  spacerHeight(height: 22),
                  InkWell(
                    child: Text(
                      'المنزل',
                      style: UITextStyle.title.copyWith(
                        color: UIColors.darkGrey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
