import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/place_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class AddPlaceNameDialog extends StatelessWidget {
  AddPlaceNameDialog({super.key});

  final placeController = Get.find<PlaceController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: UIColors.white,
        title: Text(
          'أدخل اسم المكان الذي تريد تثبيته',
          textAlign: TextAlign.center,
          style: UITextStyle.body.copyWith(
            color: UIColors.lightDeepBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          OrdTextFormField(
            controller: placeController.placeNameController,
          ),
          spacerHeight(),
          Obx(
            () {
              return AcceptButton(
                text: 'تثبيت',
                onPressed: () {
                  placeController.createPlace();
                },
                isLoading: placeController.savingPlace.value,
              );
            },
          ),
        ],
      ),
    );
  }
}
