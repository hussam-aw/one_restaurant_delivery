import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/box_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/place.dart';

class PlacesController extends GetxController {
  BoxClient boxClient = BoxClient();
  List<Place> pinnedPlaces = [];
  var isLoadingPinnedPlaces = false.obs;

  Future<void> getPinnedPlaces() async {
    isLoadingPinnedPlaces.value = true;
    pinnedPlaces = await boxClient.getPinnedPlaces();
    isLoadingPinnedPlaces.value = false;
  }
}
