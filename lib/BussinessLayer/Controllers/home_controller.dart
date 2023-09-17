import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/categories_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/complaints_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/favorites_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/notifications_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/offers_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/orders_controllers.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/places_controller.dart';

class HomeController extends GetxController {
  var offersController = Get.put(OffersController());
  var categoriesController = Get.put(CategoriesController());
  var mealsController = Get.put(MealsController());
  final cartController = Get.put(CartController());
  final favouriteController = Get.put(FavouritesController());
  final complaintsController = Get.put(ComplaintsController());
  final placesController = Get.put(PlacesController());
  final ordersController = Get.put(OrdersController());
  final notificationsController = Get.put(NotificationsController());

  void fetchHomeData() async {
    offersController.getOffers();
    categoriesController.getCategories();
    mealsController.getFeaturedMeals();
    await mealsController.getMeals();
    await cartController.getCartItemsFromStorage();
    await favouriteController.getFavouriteMeals();
    await placesController.getPinnedPlaces();
    complaintsController.getComplaints();
    ordersController.getOrders();
    notificationsController.getNotifications();
  }

  @override
  onInit() async {
    fetchHomeData();
    super.onInit();
  }
}
