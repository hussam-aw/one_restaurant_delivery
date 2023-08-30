import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/places_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Helpers/location_helper.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/box_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/place.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/snackbars.dart';

class PlaceController extends GetxController {
  LocationHelper locationHelper = LocationHelper();
  Map<String, double?>? currentLocationData;
  TextEditingController placeNameController = TextEditingController();
  BoxClient boxClient = BoxClient();
  final placesController = Get.find<PlacesController>();
  var loadingLocation = false.obs;
  var savingPlace = false.obs;

  Future<void> getCurrentLocationData() async {
    loadingLocation.value = true;
    currentLocationData = await locationHelper.getCurrentLocation();
    loadingLocation.value = false;
  }

  Future<void> createPlace() async {
    if (placeNameController.text.isNotEmpty) {
      savingPlace.value = true;
      Place place = Place(
        name: placeNameController.text,
        lat: currentLocationData!['lat'],
        long: currentLocationData!['long'],
      );
      placesController.pinnedPlaces.add(place);
      await boxClient.addToPinnedPlaces(placesController.pinnedPlaces);
      await placesController.getPinnedPlaces();
      savingPlace.value = false;
      Get.back();
      SnackBars.showSuccess('تم تثبيت المكان بنجاح');
    } else {
      SnackBars.showWarning('يرجى تعبئة الحقول المطلوبة');
    }
  }
}
