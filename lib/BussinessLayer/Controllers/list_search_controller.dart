import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/categories_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/offers_controller.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/Category.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/offer.dart';

class ListSearchController extends GetxController {
  var offersController = Get.find<OffersController>();
  var categoriesController = Get.find<CategoriesController>();
  var mealsController = Get.find<MealsController>();
  List<Meal> filteredMealList = [];
  List<Category> filteredCategoryList = [];
  List<Offer> filteredOfferList = [];
  String searchText = "";

  void search(text) async {
    searchText = text;
    if (text.isNotEmpty) {
      filteredMealList = mealsController.mealsByCategory
          .where((meal) => meal.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      filteredCategoryList = categoriesController.categories
          .where((category) =>
              category.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      filteredOfferList = offersController.offers
          .where((offer) => offer.meal.name.contains(text.toLowerCase()))
          .toList();
    } else {
      clearFilteredLists();
    }
    update();
  }

  void clearFilteredLists() {
    filteredMealList.clear();
    filteredCategoryList.clear();
    filteredOfferList.clear();
  }

  @override
  void onClose() {
    clearFilteredLists();
    super.onClose();
  }
}
