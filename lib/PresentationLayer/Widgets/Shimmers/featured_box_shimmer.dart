import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Shimmers/base_shimmer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Shimmers/image_container_shimmer.dart';

class FeaturedBoxShimmer extends StatelessWidget {
  const FeaturedBoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: raduis20,
        color: UIColors.lightDeepBlue,
      ),
      child: Column(
        children: [
          const Expanded(flex: 5, child: ImageContainerShimmer()),
          spacerHeight(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Shimmerwidget.rectangler(
                    height: 20,
                    width: 70,
                  ),
                  spacerWidth(),
                  const Shimmerwidget.rectangler(
                    height: 20,
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
