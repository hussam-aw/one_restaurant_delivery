import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';

class OrdImageContainer extends StatelessWidget {
  const OrdImageContainer({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColors.darkGray,
        borderRadius: raduis20,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
