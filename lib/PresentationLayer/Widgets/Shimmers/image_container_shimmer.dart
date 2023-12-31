import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Shimmers/base_shimmer.dart';

class ImageContainerShimmer extends StatelessWidget {
  const ImageContainerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmerwidget.roundedrectangler(
      width: Get.width,
      height: Get.height,
    );
  }
}
