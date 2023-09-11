import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/auth_controller.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/app_icon_header.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/primary_line.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class OtpRegisterScreen extends StatelessWidget {
  OtpRegisterScreen({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
            child: Column(
              children: [
                const AppIconHeader(),
                Expanded(
                  flex: 3,
                  child: Form(
                    child: Column(
                      children: [
                        OrdTextFormField(
                          controller: authController.phoneNumberController,
                          keyboardType: TextInputType.phone,
                          hintText: 'رقم الموبايل',
                        ),
                        spacerHeight(height: 22),
                        Obx(() {
                          return AcceptButton(
                            onPressed: () {
                              authController.registerOtp();
                            },
                            text: 'تسجيل',
                            isLoading: authController.register.value,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: const PrimaryLine(),
      ),
    );
  }
}
