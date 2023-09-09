import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Helpers/location_helper.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/coordinates.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/settings_repo.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Splash/request_location_dialog.dart';
import 'package:one_restaurant_delivery/main.dart';

class SplashController extends GetxController {
  LocationHelper locationHelper = LocationHelper();
  Coordinates? locationData;
  SettingsRepo repo = SettingsRepo();

  Future<void> requestCurrentLocation() async {
    locationData = await locationHelper.getCurrentLocation();
    if (locationData != null) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        MyApp.currentLocationData = locationData;
        Get.offAndToNamed(AppRoutes.homeScreen);
      });
    } else {
      Get.dialog(barrierDismissible: false, RequestLocationDialog());
    }
  }

  Future<void> getInitialSettings() async {
    MyApp.initialSettings = await repo.getInitialSettings();
  }

  @override
  void onInit() async {
    await requestCurrentLocation();
    await getInitialSettings();
    super.onInit();
  }
}
