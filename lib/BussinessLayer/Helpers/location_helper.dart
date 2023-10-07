import 'package:location/location.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/coordinates.dart';

class LocationHelper {
  Location location = Location();

  Future<Coordinates?> getCurrentLocation() async {
    PermissionStatus permissionGranted;
    LocationData? locationData;
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return null;
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return null;
    }
    locationData = await Future.any([
      location.getLocation(),
      Future.delayed(const Duration(seconds: 3), () => null),
    ]);
    locationData ??= await location.getLocation();
    return Coordinates(
        lat: locationData.latitude, long: locationData.longitude);
  }
}
