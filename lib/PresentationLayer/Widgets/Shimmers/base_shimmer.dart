import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerwidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const Shimmerwidget.circular({
    Key? key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  }) : super(key: key);

  const Shimmerwidget.rectangler({
    Key? key,
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
  }) : super(key: key);

  const Shimmerwidget.roundedrectangler({
    Key? key,
    required this.width,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(borderRadius: raduis20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: UIColors.darkGrey,
      highlightColor: UIColors.shimmersHighlight,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: UIColors.darkGrey,
        ),
      ),
    );
  }
}
