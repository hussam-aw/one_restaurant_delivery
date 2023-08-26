import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';

class OrdIconButton extends StatelessWidget {
  const OrdIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = UIColors.white,
    this.borderRadius = raduis12,
    required this.onPressed,
  });

  final Icon icon;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: UIColors.veryDarkGrey,
        ),
      ),
      child: Center(
        child: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}
