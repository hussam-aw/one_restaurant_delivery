import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Public/splash_screen.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => SplashScreen(),
  ),
];
