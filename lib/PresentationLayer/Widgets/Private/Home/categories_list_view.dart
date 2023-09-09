import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/Category.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Home/category_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Shimmers/category_box_shimmer.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return categories.isNotEmpty
        ? ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return CategoryBox(
                category: categories[index],
                onTap: () {
                  Get.toNamed(AppRoutes.mealsScreen,
                      arguments: categories[index].id);
                },
              );
            },
            separatorBuilder: (BuildContext context, index) =>
                spacerWidth(width: 25),
            itemCount: categories.length,
          )
        : ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return const CategoryBoxShimmer();
            },
            separatorBuilder: (BuildContext context, index) =>
                spacerWidth(width: 25),
            itemCount: 20,
          );
  }
}
