import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Private/complaints_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/auth/auth_phone_code_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/categories_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/favorites_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/notifications_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Private/orders_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/auth/otp_register_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/pinned_places_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Private/profile_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/shopping_cart_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/home_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/search_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/splash_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/meal_screen.dart';

import '../PresentationLayer/Public/meals_screen.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.otpRegisterScreen,
    page: () => OtpRegisterScreen(),
  ),
  GetPage(
    name: AppRoutes.authPhoneCodeScreen,
    page: () => AuthPhoneCodeScreen(),
  ),
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.mealsScreen,
    page: () => MealsScreen(),
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
    name: AppRoutes.favoritesScreen,
    page: () => FavoritesScreen(),
  ),
  GetPage(
    name: AppRoutes.complaintsScreen,
    page: () => ComplaintsScreen(),
  ),
  GetPage(
    name: AppRoutes.pinnedPlacesScreen,
    page: () => PinnedPlacesScreen(),
  ),
  GetPage(
    name: AppRoutes.searchScreen,
    page: () => SearchScreen(),
  ),
  GetPage(
    name: AppRoutes.notificationsScreen,
    page: () => NotificationsScreen(),
  ),
  GetPage(
    name: AppRoutes.profileScreen,
    page: () => ProfileScreen(),
  ),
  GetPage(
    name: AppRoutes.categoriesScreen,
    page: () => CategoriesScreen(),
  ),
];
