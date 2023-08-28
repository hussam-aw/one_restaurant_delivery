import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/drawer_list_tile.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/ui_colors.dart';
import '../../../Constants/ui_text_styles.dart';

class OrdDrawer extends StatelessWidget {
  const OrdDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UIColors.lightDeepBlue,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: UIColors.darkDeepBlue,
            ),
            accountName: Text(
              'Ruba',
              style: UITextStyle.title,
            ),
            accountEmail: Text(
              '099999999',
              style: UITextStyle.xsmall,
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
              'assets/images/person.png',
            )),
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
              Get.toNamed(AppRoutes.mealScreen, arguments: 0);
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
        ],
      ),
    );
  }
}
