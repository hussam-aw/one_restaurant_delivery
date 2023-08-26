import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/home_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
