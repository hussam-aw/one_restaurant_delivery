import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';

class AddCurrentLocationBottomSheet extends StatelessWidget {
  const AddCurrentLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * .5,
      decoration: const BoxDecoration(
        borderRadius: raduis32Top,
        color: UIColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Text(
                'إضافة الموقع الحالي للأماكن المثبتة',
                style: UITextStyle.body.copyWith(
                  color: UIColors.lightDeepBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'سيسهل عليك إرسال الطلب للمكان المثبت بشكل مباشر من مكان آخر ( إرسال الطلب للبيت من المكتب ) ',
                  textAlign: TextAlign.center,
                  style: UITextStyle.small.copyWith(
                    color: UIColors.lightDeepBlue,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: AcceptButton(
                text: 'إضافة الموقع الحالي',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
