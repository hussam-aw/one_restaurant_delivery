import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAndToNamed(AppRoutes.homeScreen));
    super.onInit();
  }
}
