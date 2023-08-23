import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/meal_repo.dart';

import '../../DataAccesslayer/Models/Category.dart';
import '../../DataAccesslayer/Repositories/category_repo.dart';

class MealsController extends GetxController {
  MealRepo mealRepo = MealRepo();
  CategoryRepo categoryRepo = CategoryRepo();

  List<Meal> meals = [];
  List<Meal> mealsByCategory = [];
  List<Category> categories = [];

  late int current = 0;

  late int categoryId = Get.arguments;

  @override
  onInit() async {
    categories = await categoryRepo.getCategories();

    meals = await mealRepo.getMeals();
       current = categoryId;
    if (categoryId != 0) {
      mealsByCategory = meals
          .where((element) => element.categoryId.isEqual(categoryId))
          .toList();
    } else {
      mealsByCategory = meals;
    }

    update();

    super.onInit();
  }

  getMealsByCategory(categoryId) async {
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
    update();
  }

  // Future<void> getFeaturedMeals() async {
  //   featuredMeals = await mealRepo.getFeaturedMeals();
  //   update();
  // }

  Meal? getMealFromId(mealId) {
    var meal = meals.firstWhereOrNull((meal) => meal.id == mealId);
    if (meal != null) {
      return meal;
    }
    return null;
  }

  getUpdate() {
    update();
  }
}
