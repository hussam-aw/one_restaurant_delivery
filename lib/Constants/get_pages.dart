import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/splash_screen.dart';

import '../PresentationLayer/Public/meals.dart';


List<GetPage<dynamic>> getPages = [
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => SplashScreen(),
  ),

    GetPage(
    name: AppRoutes.Meals,
    page: () =>  Meals(),
  ),
];
