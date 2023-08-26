import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/favorites_controller.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Meals/meal_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import '../Widgets/Public/ord_appbar.dart';
import '../Widgets/Public/ord_drawer.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final favouritesController = Get.find<FavouritesController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: const OrdDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                const PageTitle(title: 'المفضلة'),
                spacerHeight(height: 25),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return MealBox(
                        meal: favouritesController.favoriteMeals[index],
                        showFavouriteIcon: false,
                      );
                    },
                    separatorBuilder: (context, index) => spacerHeight(),
                    itemCount: favouritesController.favoriteMeals.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
