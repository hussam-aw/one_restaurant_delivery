// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/categories_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/offers_controller.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Home/categories_list_view.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Home/featured_meals_list_view.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_bottom_navigation_bar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_slider.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/section_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Shimmers/image_container_shimmer.dart';
import '../../BussinessLayer/Controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.put(HomeController());
  final offersController = Get.find<OffersController>();
  final categoriesController = Get.find<CategoriesController>();
  final mealsController = Get.find<MealsController>();

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: const OrdDrawer(),
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
<<<<<<< HEAD
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
=======
                  GetBuilder<OffersController>(
                      init: offersController,
                      builder: (_) => OrdSlider(
                            widgets: offersController.offers.isNotEmpty
                                ? offersController.offers
                                    .map(
                                      (offer) => OrdImageContainer(
                                        imagePath: offer.image,
                                      ),
                                    )
                                    .toList()
                                : [const ImageContainerShimmer()],
                          )),
>>>>>>> d86d249a2877476b2696bc296b628c22f36754de
                  spacerHeight(height: 25),
                  const SectionTitle(title: 'التصنيفات'),
                  spacerHeight(height: 20),
                  SizedBox(
                    height: 120,
                    child: Obx(
                      () => categoriesController.isLoadingCategories.value
                          ? const CategoriesListView(
                              categories: [],
                            )
                          : CategoriesListView(
                              categories: categoriesController.categories,
                            ),
                    ),
                  ),
                  spacerHeight(height: 25),
                  const SectionTitle(title: 'أبرز الوجبات'),
                  spacerHeight(height: 20),
                  SizedBox(
                    height: 200,
                    child: Obx(
                      () => mealsController.isLoadingFeaturedMeals.value
                          ? const FeaturedProductsListView(
                              meals: [],
                            )
                          : FeaturedProductsListView(
                              meals: mealsController.featuredMeals,
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
