import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';

PreferredSize ordAppBar() {
  return PreferredSize(
    preferredSize: Size(Get.width, 70),
    child: AppBar(
      elevation: 0.0,
      backgroundColor: UIColors.darkDeepBlue,
      centerTitle: true,
      title: const Text(
        'مطعم رواد حلب',
        style: UITextStyle.heading,
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            padding: const EdgeInsets.only(right: 40),
            icon: Icon(
              Icons.menu,
              size: 35,
              color: UIColors.white.withOpacity(0.5),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.cartShopping,
            size: 24,
            color: UIColors.white,
          ),
          onPressed: () {},
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6, left: 7),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ),
      ],
    ),
  );
}
