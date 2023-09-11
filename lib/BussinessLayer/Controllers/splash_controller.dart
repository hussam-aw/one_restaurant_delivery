import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Helpers/location_helper.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/box_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/coordinates.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/settings_repo.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Splash/request_location_dialog.dart';
import 'package:one_restaurant_delivery/main.dart';

class SplashController extends GetxController {
  LocationHelper locationHelper = LocationHelper();
  BoxClient boxClient = BoxClient();
  Coordinates? locationData;
  SettingsRepo repo = SettingsRepo();

  Future<void> requestCurrentLocation() async {
    locationData = await locationHelper.getCurrentLocation();
    if (locationData != null) {
      Future.delayed(const Duration(seconds: 3)).then((value) async {
        MyApp.currentLocationData = locationData;
        await checkAuthed();
      });
    } else {
      Get.dialog(barrierDismissible: false, RequestLocationDialog());
    }
  }

  Future<void> checkAuthed() async {
    bool authed = await boxClient.getAuthState();
    if (authed == true) {
      MyApp.appUser = await boxClient.getAuthedUser();
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAndToNamed(AppRoutes.homeScreen));
    } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAndToNamed(AppRoutes.otpRegisterScreen));
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
