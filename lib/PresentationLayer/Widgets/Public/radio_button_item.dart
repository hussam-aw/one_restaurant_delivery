import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';

class RadioButtonItem extends StatelessWidget {
  const RadioButtonItem({
    super.key,
    required this.text,
    this.style = UITextStyle.medium,
    this.isSelected = false,
    this.selectionColor = UIColors.red,
    this.unselectionColor = UIColors.lightDeepBlue,
    this.selectedTextColor = UIColors.white,
    required this.onTap,
  });

  final String text;
  final TextStyle style;
  final bool isSelected;
  final Color selectionColor;
  final Color unselectionColor;
  final Color selectedTextColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? selectionColor : unselectionColor,
          border: isSelected ? null : Border.all(color: UIColors.lightRed),
          borderRadius: raduis20,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: Center(
          child: Text(
            text,
            softWrap: true,
            style: style.copyWith(
              color: UIColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
