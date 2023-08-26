import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';

// ignore: must_be_immutable
class AcceptButton extends StatelessWidget {
  const AcceptButton({
    super.key,
    required this.text,
    this.backgroundColor = UIColors.red,
    this.textStyle = UITextStyle.medium,
    required this.onPressed,
  });

  final String text;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
          ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          softWrap: true,
          style: textStyle,
        ),
      ),
    );
  }
}
