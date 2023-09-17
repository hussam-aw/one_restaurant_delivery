import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/categories_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/Category.dart';

class MealsScreenController extends GetxController {
  final categoriesController = Get.find<CategoriesController>();
  final mealsController = Get.find<MealsController>();

  void setInitialScreenState(Category? category) {
    if (category != null) {
      categoriesController.setSelectedCategoryId(category.id);
      mealsController.getMealsByCategory(category.id);
    }
  }
}
