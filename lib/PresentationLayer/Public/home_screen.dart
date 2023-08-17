// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Home/category_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Home/favourite_meal_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_bottom_navigation_bar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_slider.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/section_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
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
                  const OrdSlider(
                    widgets: [
                      OrdImageContainer(
                        imagePath: 'assets/images/co1.png',
                      ),
                      OrdImageContainer(
                        imagePath: 'assets/images/co2.png',
                      ),
                      OrdImageContainer(
                        imagePath: 'assets/images/co3.png',
                      ),
                    ],
                  ),
                  spacerHeight(height: 25),
                  const SectionTitle(title: 'التصنيفات'),
                  spacerHeight(height: 20),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryBox(
                          categoryImage: 'assets/images/cat${index + 1}.png',
                          categoryName: categories[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          spacerWidth(width: 25),
                      itemCount: 4,
                    ),
                  ),
                  spacerHeight(height: 25),
                  const SectionTitle(title: 'أبرز الوجبات'),
                  spacerHeight(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return FavoutiteMealBox(
                          onTap: () {
                            Get.toNamed(AppRoutes.mealScreen);
                          },
                          mealImage: 'assets/images/fav${index + 1}.png',
                          mealName: favouriteMeals[index],
                          mealPrice: '10\$',
                        );
                      },
                      separatorBuilder: (context, index) =>
                          spacerWidth(width: 25),
                      itemCount: 3,
                    ),
                  ),
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
