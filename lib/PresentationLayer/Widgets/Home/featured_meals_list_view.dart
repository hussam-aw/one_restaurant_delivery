import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Home/favourite_meal_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Shimmers/featured_box_shimmer.dart';

class FeaturedProductsListView extends StatelessWidget {
  const FeaturedProductsListView({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return meals.isNotEmpty
        ? ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FavoutiteMealBox(
                meal: meals[index],
                onTap: () {
                  Get.toNamed(AppRoutes.mealScreen, arguments: meals[index]);
                },
              );
            },
            separatorBuilder: (context, index) => spacerWidth(width: 25),
            itemCount: meals.length,
          )
        : ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const FeaturedBoxShimmer();
            },
            separatorBuilder: (context, index) => spacerWidth(width: 25),
            itemCount: 20,
          );
  }
}
