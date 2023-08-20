// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_pages.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Home/category_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Home/favourite_meal_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_bottom_navigation_bar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_slider.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/section_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

import '../../BussinessLayer/Controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var categories = ['غربي', 'شاورما', 'فلافل', 'كبة'];
  var favouriteMeals = [
    'وجبة كريسبي مع مقبلات',
    'وجبة فطاير شامية منوعة',
    'وجبة فطاير شامية منوعة'
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer:  OrdDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrdTextFormField(
                    controller: TextEditingController(),
                    hintText: 'إبحث عن وجبات , أصناف , عروض',
                  ),
                  spacerHeight(height: 25),
                  const SectionTitle(title: 'أبرز العروض'),
                  spacerHeight(height: 20),
                  GetBuilder<HomeController>(
                      builder: (controller) => controller.offers.isNotEmpty
                          ? OrdSlider(
                              widgets: [
                                for (var i = 0;
                                    i < controller.offers.length;
                                    i++)
                                  OrdImageContainer(
                                    imagePath: controller.offers[i].image,
                                  ),
                              ],
                            )
                          : Container()),
                  spacerHeight(height: 25),
                  const SectionTitle(title: 'التصنيفات'),
                  spacerHeight(height: 20),
                  SizedBox(
                    height: 100,
                    child: GetBuilder<HomeController>(
                        builder: (controller) => ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categories.length,
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                  child: CategoryBox(
                                    categoryImage:
                                        controller.categories[index].image,
                                    categoryName:
                                        controller.categories[index].name,
                                  ),
                                  onTap: () {
                                      Get.toNamed(AppRoutes.Meals , arguments: controller.categories[index].id);
                                  
                                  },
                                );
                              },
                              separatorBuilder: (BuildContext context, index) =>
                                  spacerWidth(width: 25),
                            )),
                  ),
                  spacerHeight(height: 25),
                  const SectionTitle(title: 'أبرز الوجبات'),
                  spacerHeight(height: 20),
                  SizedBox(
                    height: 200,
                    child: GetBuilder<HomeController>(
                      builder: (controller) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.meals.length,
                        itemBuilder: (context, index) {
                          return FavoutiteMealBox(
                            onTap: () {
                              Get.toNamed(AppRoutes.mealScreen , arguments: controller.meals[index]);
                            },
                            mealImage: controller.meals[index].image,
                            mealName: controller.meals[index].name,
                            mealPrice: controller.meals[index].price.toString(),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            spacerWidth(width: 25),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const OrdBottomNavigationBar(),
      ),
    );
  }
}
