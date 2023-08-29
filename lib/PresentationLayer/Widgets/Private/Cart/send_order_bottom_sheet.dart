import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/order_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/places_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

class SendOrderBottomSheet extends StatelessWidget {
  SendOrderBottomSheet({super.key});

  final orderController = Get.put(OrderController());
  final placesController = Get.find<PlacesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'إرسال الطلب',
                style: UITextStyle.heading.copyWith(
                  color: UIColors.lightDeepBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            spacerWidth(),
            Expanded(
              flex: 3,
              child: Align(
                child: ListView.separated(
                  itemBuilder: (contex, index) {
                    return InkWell(
                      onTap: () {
                        orderController
                            .createOrder(placesController.pinnedPlaces[index]);
                      },
                      child: Text(
                        placesController.pinnedPlaces[index].name,
                        textAlign: TextAlign.center,
                        style: UITextStyle.title.copyWith(
                          color: UIColors.darkGrey,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (contex, index) => spacerHeight(height: 20),
                  itemCount: placesController.pinnedPlaces.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
