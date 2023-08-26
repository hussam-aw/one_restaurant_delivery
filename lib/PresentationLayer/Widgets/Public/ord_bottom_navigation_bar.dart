// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/main.dart';

class OrdBottomNavigationBar extends StatelessWidget {
  const OrdBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: UITextStyle.xsmall,
      unselectedLabelStyle: UITextStyle.xsmall,
      backgroundColor: UIColors.red,
      selectedItemColor: UIColors.white,
      unselectedItemColor: UIColors.white.withOpacity(.5),
      currentIndex: MyApp.bottomSelectedItem,
      type: BottomNavigationBarType.fixed,
      onTap: ((value) {
        MyApp.bottomSelectedItem = value;
        switch (value) {
          case 0:
            Get.toNamed(AppRoutes.homeScreen);
            break;

          case 1:
            Get.toNamed(AppRoutes.mealsScreen);
            break;

          case 2:
            Get.toNamed(AppRoutes.shoppingCartScreen);
            break;

          case 3:
            //Get.toNamed(AppRoutes.notificationsScreen);
            break;
          case 4:
            Get.toNamed(AppRoutes.favoritesScreen);
            break;
        }
      }),
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.house,
              size: 28,
            ),
          ),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.burger,
              size: 28,
            ),
          ),
          label: 'الوجبات',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.cartShopping,
              size: 28,
            ),
          ),
          label: 'سلة الشراء',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.bell,
              size: 28,
            ),
          ),
          label: 'الإشعارات',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.heart,
              size: 28,
            ),
          ),
          label: 'المفضلة',
        ),
      ],
    );
  }
}
