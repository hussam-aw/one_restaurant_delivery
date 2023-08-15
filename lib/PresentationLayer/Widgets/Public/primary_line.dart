import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';

class PrimaryLine extends StatelessWidget {
  const PrimaryLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      color: UIColors.red,
    );
  }
}
