// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OrdPinCodeFields extends StatelessWidget {
  const OrdPinCodeFields(
      {super.key, required this.length, this.controller, this.onCompleted});

  final int length;
  final TextEditingController? controller;
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: raduis12,
        inactiveFillColor: UIColors.lightDeepBlue,
        activeColor: UIColors.lightDeepBlue,
        selectedFillColor: UIColors.lightDeepBlue,
        selectedColor: UIColors.lightDeepBlue,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: UIColors.darkDeepBlue,
      enableActiveFill: true,
      autoDismissKeyboard: true,
      keyboardType: TextInputType.number,
      controller: controller,
      onCompleted: onCompleted,
    );
  }
}
