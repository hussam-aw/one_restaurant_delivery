import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/auth_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/app_icon_header.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_pin_code_fields.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class AuthPhoneCodeScreen extends StatelessWidget {
  AuthPhoneCodeScreen({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              children: [
                const AppIconHeader(),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width * .6,
                          child: Text(
                            'لقد قمنا بإرسال رمز مكون من 6 أرقام قم بإدخاله لتأكيد الحساب',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: UITextStyle.body.copyWith(height: 1.5),
                          ),
                        ),
                        spacerHeight(),
                        OrdPinCodeFields(
                          length: 6,
                          controller:
                              authController.authenticationCodeController,
                          onCompleted: (value) {
                            authController.login();
                          },
                        ),
                        spacerHeight(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
