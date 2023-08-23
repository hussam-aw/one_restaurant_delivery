import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Private/favorites_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Private/orders_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Private/shopping_cart_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/home_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/splash_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Private/meal_screen.dart';

import '../PresentationLayer/Public/meals.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.Meals,
    page: () => Meals(),
  ),
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.mealScreen,
    page: () => MealScreen(),
  ),
  GetPage(
    name: AppRoutes.shoppingCartScreen,
    page: () => ShoppingCartScreen(),
  ),
  GetPage(
    name: AppRoutes.ordersScreen,
    page: () => OrdersScreen(),
  ),
   GetPage(
    name: AppRoutes.favorites,
    page: () => const FavoritesScreen(),
  ),
];
