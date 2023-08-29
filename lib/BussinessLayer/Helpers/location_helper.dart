import 'package:location/location.dart';

class LocationHelper {
  Location location = Location();

  Future<Map<String, double?>?> getCurrentLocation() async {
    PermissionStatus permissionGranted;
    LocationData locationData;
    Map<String, double?> locData = {};

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

    locationData = await location.getLocation();
    locData.addAll({'lat': locationData.latitude});
    locData.addAll({'long': locationData.longitude});
    return locData;
  }
}
