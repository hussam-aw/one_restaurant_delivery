import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/home_screen.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/splash_screen.dart';

import '../PresentationLayer/Public/meals.dart';


List<GetPage<dynamic>> getPages = [
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => SplashScreen(),
  ),
<<<<<<< HEAD

    GetPage(
    name: AppRoutes.Meals,
    page: () =>  Meals(),
=======
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => HomeScreen(),
>>>>>>> 47f5e7b75728688f8a349bbc33994283e237e99b
  ),
];
