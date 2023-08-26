import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/meal_repo.dart';
import '../../DataAccesslayer/Repositories/category_repo.dart';

class MealsController extends GetxController {
  MealRepo mealRepo = MealRepo();
  CategoryRepo categoryRepo = CategoryRepo();
  var isLoadingMeals = true.obs;
  var isLoadingFeaturedMeals = false.obs;

  List<Meal> meals = [];
  List<Meal> mealsByCategory = [];
  List<Meal> featuredMeals = [];

  Future<void> getMeals() async {
    isLoadingMeals.value = true;
    meals = await mealRepo.getMeals();
    mealsByCategory = meals;
    isLoadingMeals.value = false;
  }

  Future<void> getMealsByCategory(categoryId) async {
    isLoadingMeals.value = true;
    mealsByCategory = await mealRepo.getMealsByCategoryId(categoryId);
    isLoadingMeals.value = false;
  }

  Future<void> getFeaturedMeals() async {
    isLoadingFeaturedMeals.value = true;
    featuredMeals = await mealRepo.getFeaturedMeals();
    isLoadingFeaturedMeals.value = false;
  }

  Meal? getMealFromId(mealId) {
    var meal = meals.firstWhereOrNull((meal) => meal.id == mealId);
    if (meal != null) {
      return meal;
    }
    return null;
  }
}
