import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/auth_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/profile_controller.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/drawer_list_tile.dart';
import 'package:one_restaurant_delivery/main.dart';

import '../../../Constants/get_routes.dart';
import '../../../Constants/ui_colors.dart';
import '../../../Constants/ui_text_styles.dart';

class OrdDrawer extends StatelessWidget {
  OrdDrawer({super.key});
  final authController = Get.put(AuthController());
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UIColors.lightDeepBlue,
      child: ListView(
        children: [
          GetBuilder<ProfileController>(
              init: profileController,
              builder: (context) {
                return UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: UIColors.red,
                  ),
                  accountName: Text(
                    MyApp.appUser!.name,
                    style: UITextStyle.title,
                  ),
                  accountEmail: Text(
                    MyApp.appUser!.phone,
                    style: UITextStyle.xsmall,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: UIColors.lightGrey,
                    backgroundImage: AssetImage(
                      'assets/images/person.png',
                    ),
                  ),
                );
              }),
          if (MyApp.appUser != null)
            DrawerListTile(
              title: 'الملف الشخصي',
              iconData: Icons.people,
              onTap: () {
                Get.toNamed(AppRoutes.profileScreen);
              },
            ),
          DrawerListTile(
            title: 'الرئيسية',
            iconData: FontAwesomeIcons.house,
            onTap: () {
              Get.toNamed(AppRoutes.homeScreen);
            },
          ),
          DrawerListTile(
            title: 'التصنيفات',
            iconData: Icons.menu_outlined,
            onTap: () {
              Get.toNamed(AppRoutes.categoriesScreen, arguments: 0);
            },
          ),
          DrawerListTile(
            title: 'السلة',
            iconData: FontAwesomeIcons.cartShopping,
            onTap: () {
              Get.toNamed(AppRoutes.shoppingCartScreen);
            },
          ),
          DrawerListTile(
            title: 'الطلبات',
            iconData: FontAwesomeIcons.cartShopping,
            onTap: () {
              Get.toNamed(AppRoutes.ordersScreen);
            },
          ),
          DrawerListTile(
            title: 'المفضلة',
            iconData: FontAwesomeIcons.heart,
            onTap: () {
              Get.toNamed(AppRoutes.favoritesScreen);
            },
          ),
          DrawerListTile(
            title: 'الشكاوى والمقترحات',
            iconData: FontAwesomeIcons.penToSquare,
            onTap: () {
              Get.toNamed(AppRoutes.complaintsScreen);
            },
          ),
          DrawerListTile(
            title: 'الأماكن المثبتة',
            iconData: FontAwesomeIcons.locationPin,
            onTap: () {
              Get.toNamed(AppRoutes.pinnedPlacesScreen);
            },
          ),
          if (MyApp.appUser != null)
            DrawerListTile(
              title: 'تسجيل الخروج',
              iconData: Icons.exit_to_app,
              onTap: () async {
                await authController.logout();
              },
            ),
        ],
      ),
    );
  }
}
