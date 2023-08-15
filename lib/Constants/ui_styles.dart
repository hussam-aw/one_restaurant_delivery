// Input Styles
import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';

//Input Decoration
final normalTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: UIColors.lightDeepBlue,
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: UIColors.red,
    ),
    borderRadius: BorderRadius.circular(17),
  ),
  hintStyle: UITextStyle.small.copyWith(
    color: UIColors.lightGray,
  ),
);

//Border Radius
const raduis20 = BorderRadius.all(Radius.circular(20));
