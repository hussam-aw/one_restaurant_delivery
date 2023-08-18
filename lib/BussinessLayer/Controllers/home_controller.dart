import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_pages.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/offer.dart';

import '../../Constants/get_routes.dart';
import '../../DataAccesslayer/Models/Category.dart';
import '../../DataAccesslayer/Repositories/category_repo.dart';
import '../../DataAccesslayer/Repositories/meal_repo.dart';
import '../../DataAccesslayer/Repositories/offer_repo.dart';

class HomeController extends GetxController {
  CategoryRepo categoryRepo = CategoryRepo();
  MealRepo mealRepo = MealRepo();
  OfferRepo offerRepo = OfferRepo();

  List<Category> categories = [];
  List<Offer> offers = [];
  List<Meal> meals = [];
  List<Meal> mealsByCategory = [];

  late int current = 0;

  @override
  onInit() async {
    categories = await categoryRepo.getCategories();

    offers = await offerRepo.getOffers();

    meals = await mealRepo.getFeaturedMeals();

    update();

    super.onInit();
  }

  getMeals(categoryId) async {
    current = categoryId;

    mealsByCategory = meals
        .where((element) => element.categoryId.isEqual(categoryId))
        .toList();

    if (mealsByCategory.isNotEmpty) {
      update();
    }
    if (mealsByCategory.isEmpty) {
      mealsByCategory = meals;
      update();
      print(meals);
      print(mealsByCategory);
    }
    if (categoryId == 0) {
      mealsByCategory = meals;
      current = 0;
      update();
    }
    Get.toNamed(AppRoutes.Meals);
  }
}
