import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/categories_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Meals/meal_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_bottom_navigation_bar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_radio_group.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/radio_button_item.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key});

  final categoriesController = Get.find<CategoriesController>();
  final mealsController = Get.find<MealsController>();

  Widget buildMealsList(List<Meal> meals) {
    return meals.isEmpty
        ? const Center(
            child: Text(
              'لا يوجد وجبات',
              style: UITextStyle.medium,
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return MealBox(meal: meals[index]);
            },
            separatorBuilder: (context, index) => spacerHeight(),
            itemCount: meals.length,
          );
  }

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
                const PageTitle(title: 'لائحة الوجبات'),
                spacerHeight(height: 25),
                Obx(() {
                  return OrdRadioGroup(
                    scrollDirection: Axis.horizontal,
                    items: [
                      RadioButtonItem(
                        text: 'الكل',
                        isSelected:
                            categoriesController.checkIfCategorySelected(0),
                        onTap: () async {
                          categoriesController.setSelectedCategoryId(0);
                          mealsController.getMeals();
                        },
                      ),
                      ...categoriesController.categories.map(
                        (category) => RadioButtonItem(
                          text: category.name,
                          isSelected: categoriesController
                              .checkIfCategorySelected(category.id),
                          onTap: () async {
                            categoriesController
                                .setSelectedCategoryId(category.id);
                            mealsController.getMealsByCategory(category.id);
                          },
                        ),
                      )
                    ],
                  );
                }),
                spacerHeight(height: 22),
                Expanded(
                  child: Obx(() {
                    return mealsController.isLoadingMeals.value
                        ? Center(child: loadingItem(width: 100, isWhite: true))
                        : RefreshIndicator(
                            onRefresh: () async =>
                                categoriesController.selectedCategoryId.value !=
                                        0
                                    ? await mealsController.getMealsByCategory(
                                        categoriesController.selectedCategoryId)
                                    : await mealsController.getMeals(),
                            child:
                                buildMealsList(mealsController.mealsByCategory),
                          );
                  }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const OrdBottomNavigationBar(),
      ),
    );
  }
}
