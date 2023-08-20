import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/meal_repo.dart';

class MealsController extends GetxController {
  MealRepo mealRepo = MealRepo();
  List<Meal> meals = [];
  List<Meal> mealsByCategory = [];
  List<Meal> featuredMeals = [];
  late int current = 0;

  Future<void> getMeals() async {
    meals = await mealRepo.getMeals();
  }

  Future<void> getMealsByCategory(categoryId) async {
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
    }
    if (categoryId == 0) {
      mealsByCategory = meals;
      current = 0;
      update();
    }
    Get.toNamed(AppRoutes.Meals);
  }

  Future<void> getFeaturedMeals() async {
    featuredMeals = await mealRepo.getFeaturedMeals();
    update();
  }

  Meal? getMealFromId(mealId) {
    var meal = meals.firstWhereOrNull((meal) => meal.id == mealId);
    if (meal != null) {
      return meal;
    }
    return null;
  }
}
