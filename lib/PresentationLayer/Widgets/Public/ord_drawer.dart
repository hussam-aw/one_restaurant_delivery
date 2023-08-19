import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
          // Container(
          //   margin: EdgeInsets.all(10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       InkWell(
          //           child: Text(
          //             'en',
          //             style: TextStyle(color: Colors.white),
          //           ),
          //           onTap: () {

          //           }),
          //           Divider(color: Colors.white ,
          //           height: 10),
          //       InkWell(
          //           child: Text(
          //             'ar',
          //             style: TextStyle(color: Colors.white),
          //           ),

          //           onTap: () {

          //           })
          //     ],
          //   ),
          // ),
           ListTile(
            leading: const Icon(
               FontAwesomeIcons.house,
              color: Colors.white,
            ),
            title: const Text(
              "الرئيسية",
              style: UITextStyle.medium,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.homeScreen);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.menu_outlined,
              color: Colors.white,
            ),
            title: const Text(
              "التصنيفات",
              style: UITextStyle.medium,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.Meals);
            },
          ),
          ListTile(
            leading: const Icon(
             FontAwesomeIcons.cartShopping,
              color: Colors.white,
            ),
            title: const Text(
              "السلة",
              style: UITextStyle.medium,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.shoppingCartScreen);
            },
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.burger,
              color: Colors.white,
            ),
            title: const Text(
              "الطلبات",
              style: UITextStyle.medium,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.ordersScreen);
            },
          ),
        ],
      ),
    );
  }
}
