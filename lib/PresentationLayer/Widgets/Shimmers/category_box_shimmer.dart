import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Shimmers/base_shimmer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Shimmers/image_container_shimmer.dart';

class CategoryBoxShimmer extends StatelessWidget {
  const CategoryBoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 120,
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: ImageContainerShimmer(),
          ),
          spacerHeight(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Shimmerwidget.rectangler(
              width: Get.width,
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
