import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/categories_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/offers_controller.dart';

class HomeController extends GetxController {
  var offersController = Get.put(OffersController());
  var categoriesController = Get.put(CategoriesController());
  var mealsController = Get.put(MealsController());
  final cartController = Get.put(CartController());

  void fetchHomeData() async {
    await offersController.getOffers();
    await categoriesController.getCategories();
    await mealsController.getFeaturedMeals();
    await mealsController.getMeals();
    await cartController.getCartItems();
  }

  @override
  onInit() async {
    fetchHomeData();
    super.onInit();
  }
}
