import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/list_search_controller.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Home/category_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Meals/meal_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/section_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final searchController = Get.put(ListSearchController());

  Widget buildMealList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'الوجبات'),
        spacerHeight(),
        ...searchController.filteredMealList
            .map((meal) => Column(
                  children: [
                    MealBox(meal: meal),
                    spacerHeight(),
                  ],
                ))
            .toList(),
      ],
    );
  }

  Widget buildCategoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'التصنيفات'),
        spacerHeight(),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryBox(
                category: searchController.filteredCategoryList[index],
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) => spacerWidth(),
            itemCount: searchController.filteredCategoryList.length,
          ),
        ),
      ],
    );
  }

  Widget buildOfferList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'العروض'),
        spacerHeight(),
        ...searchController.filteredOfferList
            .map((offer) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.mealScreen,
                            arguments: offer.meal);
                      },
                      child: OrdImageContainer(
                        height: 90,
                        imagePath: offer.image,
                      ),
                    ),
                    spacerHeight(),
                  ],
                ))
            .toList()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: OrdDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrdTextFormField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  style: UITextStyle.body.copyWith(
                    color: UIColors.darkGrey,
                  ),
                  onChanged: (value) {
                    searchController.search(value);
                  },
                ),
                spacerHeight(height: 25),
                const PageTitle(title: 'نتائج البحث'),
                spacerHeight(),
                Expanded(
                  child: SingleChildScrollView(
                    child: GetBuilder<ListSearchController>(
                        init: searchController,
                        builder: (context) {
                          return Column(
                            children: [
                              if (searchController.filteredMealList.isNotEmpty)
                                buildMealList(),
                              spacerHeight(height: 25),
                              if (searchController
                                  .filteredCategoryList.isNotEmpty)
                                buildCategoryList(),
                              spacerHeight(height: 25),
                              if (searchController.filteredOfferList.isNotEmpty)
                                buildOfferList()
                            ],
                          );
                        }),
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
