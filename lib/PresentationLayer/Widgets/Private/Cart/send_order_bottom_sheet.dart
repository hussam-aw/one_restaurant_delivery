import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/order_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/places_controller.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/main.dart';

class SendOrderBottomSheet extends StatelessWidget {
  SendOrderBottomSheet({super.key});

  final orderController = Get.put(OrderController());
  final placesController = Get.find<PlacesController>();

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
            Expanded(
              child: Text(
                'إرسال الطلب',
                style: UITextStyle.heading.copyWith(
                  color: UIColors.lightDeepBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            spacerHeight(height: 35),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        orderController.createOrder(MyApp.currentLocationData);
                      },
                      child: Text(
                        'الموقع الحالي',
                        textAlign: TextAlign.center,
                        style: UITextStyle.title.copyWith(
                          color: UIColors.darkGrey,
                        ),
                      ),
                    ),
                    spacerHeight(height: 25),
                    InkWell(
                      onTap: () async {
                        var place = await Get.toNamed(
                          AppRoutes.pinnedPlacesScreen,
                          arguments: 'selection',
                        );
                        if (place != null) {
                          orderController.createOrder(place.coordinates);
                        }
                      },
                      child: Text(
                        'الأماكن المثبتة',
                        textAlign: TextAlign.center,
                        style: UITextStyle.title.copyWith(
                          color: UIColors.darkGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
