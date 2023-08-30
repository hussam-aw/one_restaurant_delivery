import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/complaint_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';

class SendComplaintBottomSheet extends StatelessWidget {
  SendComplaintBottomSheet({super.key});

  final complaintController = Get.put(ComplaintController());

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
                child: Text(
                  'إرسال مقترح | شكوى',
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
                  child: TextFormField(
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    controller:
                        complaintController.complaintDescriptionController,
                    style: UITextStyle.body.copyWith(
                      color: UIColors.darkGrey,
                    ),
                    decoration: customTextFieldStyle.copyWith(
                      fillColor: UIColors.lightGrey,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Obx(
                  () {
                    return AcceptButton(
                      text: 'إرسال',
                      onPressed: () {
                        complaintController.createCpmplaint();
                      },
                      isLoading: complaintController.loading.value,
                    );
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
