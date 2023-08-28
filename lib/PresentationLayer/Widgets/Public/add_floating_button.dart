import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';

class AddFloatingButton extends StatelessWidget {
  const AddFloatingButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(
        FontAwesomeIcons.plus,
        color: UIColors.white,
        size: 30,
      ),
    );
  }
}
