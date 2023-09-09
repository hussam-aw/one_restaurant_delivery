import 'package:one_restaurant_delivery/DataAccesslayer/Models/coordinates.dart';

class InitialSettings {
  num priceForKm;
  num minimumDeliveryAmount;
  Coordinates coordinates;

  InitialSettings({
    required this.priceForKm,
    required this.minimumDeliveryAmount,
    required this.coordinates,
  });

  factory InitialSettings.fromJson(Map<String, dynamic> json) =>
      InitialSettings(
        priceForKm: num.parse(json["priceForKm"]),
        minimumDeliveryAmount: num.parse(json["deliveryMin"]),
        coordinates: Coordinates(
          lat: double.parse(json["lat"]),
          long: double.parse(json["long"]),
        ),
      );

  Map<String, dynamic> toJson() => {
        "priceForKm": priceForKm,
        "deliveryMin": minimumDeliveryAmount,
        "lat": coordinates.lat,
        "long": coordinates.long,
      };
}
