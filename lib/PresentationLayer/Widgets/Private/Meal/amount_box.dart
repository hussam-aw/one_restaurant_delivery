import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';

class AmountBox extends StatelessWidget {
  const AmountBox({
    super.key,
    required this.amount,
    this.width = 45,
    this.height = 45,
    this.backgroundColor = UIColors.red,
    this.textStyle = UITextStyle.medium,
    this.border,
    this.shape = BoxShape.rectangle,
  });

  final String amount;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final TextStyle textStyle;
  final BoxBorder? border;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: shape,
        color: backgroundColor,
        borderRadius: shape != BoxShape.circle ? raduis22 : null,
        border: border,
      ),
      child: Center(
        child: Text(
          amount,
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
