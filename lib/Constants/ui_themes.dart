import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';

var darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: UIColors.red,
    secondary: UIColors.red,
    background: UIColors.darkDeepBlue,
    error: UIColors.red,
    surface: UIColors.lightDeepBlue,
    brightness: Brightness.dark,
    onPrimary: UIColors.red,
    onSecondary: UIColors.red,
    onError: UIColors.red,
    onBackground: UIColors.darkDeepBlue,
    onSurface: UIColors.lightDeepBlue,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: UIColors.lightDeepBlue,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: UIColors.red),
    ),
    hintStyle: UITextStyle.small.copyWith(
      color: UIColors.lightGray,
    ),
  ),
);

var lightTheme = ThemeData();
