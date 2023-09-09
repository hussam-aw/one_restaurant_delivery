import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/splash_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class RequestLocationDialog extends StatelessWidget {
  RequestLocationDialog({super.key});

  final splachController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: UIColors.white,
        title: Text(
          'يجب تشغيل الموقع الجغرافي لتتمكن من المتابعة',
          textAlign: TextAlign.center,
          style: UITextStyle.body.copyWith(
            color: UIColors.lightDeepBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          AcceptButton(
            text: 'تشغيل الموقع',
            backgroundColor: UIColors.darkDeepBlue,
            onPressed: () {
              Get.back(closeOverlays: true);
              splachController.requestCurrentLocation();
            },
          ),
          spacerHeight(),
          AcceptButton(
            text: 'الخروج',
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
