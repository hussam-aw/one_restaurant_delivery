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

  Future<void> getCurrentLocationData() async {
    currentLocationData = await locationHelper.getCurrentLocation();
  }

  Future<void> createPlace() async {
    if (placeNameController.text.isNotEmpty) {
      Place place = Place(
        name: placeNameController.text,
        lat: currentLocationData!['lat'],
        long: currentLocationData!['long'],
      );
      placesController.pinnedPlaces.add(place);
      await boxClient.addToPinnedPlaces(placesController.pinnedPlaces);
      await placesController.getPinnedPlaces();
      Get.back();
      SnackBars.showSuccess('تم تثبيت المكان بنجاح');
    } else {
      SnackBars.showWarning('يرجى تعبئة الحقول المطلوبة');
    }
  }
}
