import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../DataAccesslayer/Models/meal.dart';
import '../../DataAccesslayer/Repositories/meal_repo.dart';
import 'meals_controller.dart';

class FavoritesController extends GetxController {
  static final box = GetStorage();

  late var favorites = [];

  MealRepo mealRepo = MealRepo();

  List<Meal> mealsFavorite = [];
  late Meal a;
  
    MealsController mealsController = Get.put(MealsController());

  static List<dynamic> getFavorites() {
    return box.read('favorites') ?? [];
  }

  @override
  onInit() async {
    favorites = box.read('favorites') ?? [];

    mealsFavorite = await mealRepo.getMealsByIds(jsonEncode(favorites));

    update();
    super.onInit();
  }

  void addFavorite(productId) {
     
    if (!favorites.contains(productId)) {
      favorites = getFavorites();
      favorites.add(productId);
      box.write('favorites', favorites);
      onInit();
    
      mealsController.getUpdate();
      //controllerMeal.onInit();
    }
    update();
  }

  void removeFavorite(productId) {
     
    if (favorites.contains(productId)) {
      favorites = getFavorites();
      favorites.remove(productId);
      box.write('favorites', favorites);
      onInit();
      mealsController.getUpdate();
    }
    update();
  }
}
