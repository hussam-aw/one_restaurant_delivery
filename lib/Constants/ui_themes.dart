import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';

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
);

var lightTheme = ThemeData();
