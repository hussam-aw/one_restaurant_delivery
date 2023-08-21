import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/categories_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/offers_controller.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/offer.dart';

import '../../Constants/api_links.dart';
import '../../DataAccesslayer/Models/Category.dart';
import '../../DataAccesslayer/Models/meal.dart';
import '../../DataAccesslayer/Repositories/category_repo.dart';
import '../../DataAccesslayer/Repositories/meal_repo.dart';
import '../../DataAccesslayer/Repositories/offer_repo.dart';

class HomeController extends GetxController {

  // var offersController = Get.put(OffersController());
  // var categoriesController = Get.put(CategoriesController());
  // var mealsController = Get.put(MealsController());
  // final cartController = Get.put(CartController());

  MealRepo mealRepo = MealRepo();
  CategoryRepo categoryRepo = CategoryRepo();
  OfferRepo offerRepo = OfferRepo();

  List<Meal> meals = [];
  List<Offer> offers = [];
  List<Category> categories = [];


  @override
  onInit() async {
    
    categories = await categoryRepo.getCategories();

    offers = await offerRepo.getOffers();

    meals = await mealRepo.getFeaturedMeals();

    update();

    super.onInit();
  }

  // void fetchHomeData() async {
  //   await offersController.getOffers();
  //   await categoriesController.getCategories();
  //   await mealsController.getFeaturedMeals();
  //   await mealsController.getMeals();
  //   await cartController.getCartItems();
  // }



 
}
