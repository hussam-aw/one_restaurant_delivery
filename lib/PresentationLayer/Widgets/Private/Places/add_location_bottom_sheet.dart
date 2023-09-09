import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/place_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Places/add_place_name_dialog.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';

class AddCurrentLocationBottomSheet extends StatelessWidget {
  AddCurrentLocationBottomSheet({super.key});

  final placeController = Get.put(PlaceController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: Get.width * .7,
        decoration: const BoxDecoration(
          borderRadius: raduis32Top,
          color: UIColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'إضافة الموقع الحالي للأماكن المثبتة',
                  style: UITextStyle.body.copyWith(
                    color: UIColors.lightDeepBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
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
                  onPressed: () {
                    Get.back();
                    Get.dialog(AddPlaceNameDialog());
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
