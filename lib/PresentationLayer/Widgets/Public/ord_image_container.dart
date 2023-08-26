import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';

class OrdImageContainer extends StatelessWidget {
  const OrdImageContainer({
    super.key,
    required this.imagePath,
    this.height,
    this.backgroundColor = UIColors.darkGrey,
    this.borderRadius = raduis20,
  });

  final String imagePath;
  final double? height;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
