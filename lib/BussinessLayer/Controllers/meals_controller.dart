import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_pages.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/offer.dart';

import '../../Constants/get_routes.dart';
import '../../DataAccesslayer/Models/Category.dart';
import '../../DataAccesslayer/Repositories/category_repo.dart';
import '../../DataAccesslayer/Repositories/meal_repo.dart';

class MealsController extends GetxController {

  CategoryRepo categoryRepo = CategoryRepo();
  MealRepo mealRepo = MealRepo();


  List<Category> categories = [];
 
  List<Meal> meals = [];
  List<Meal> mealsByCategory = [];

  late int current = 0;
  late int categoryId = 0;

  @override
  onInit() async {

    categoryId = Get.arguments;
    print(categoryId);

  categories = await categoryRepo.getCategories();

    meals = await mealRepo.getMeals();

      mealsByCategory = meals
        .where((element) => element.categoryId.isEqual(categoryId))
        .toList();

 current = categoryId;

 if (categoryId == 0) {
      mealsByCategory = meals;
    
      update();
    }
    update();

    super.onInit();
  }

  getUpdate()
  {
     update();
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
    }
    if (categoryId == 0) {
      mealsByCategory = meals;
      current = 0;
      update();
    }

    Get.toNamed(AppRoutes.Meals);
  }
}
