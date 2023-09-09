import 'package:one_restaurant_delivery/DataAccesslayer/Models/coordinates.dart';

class Place {
  String name;
  Coordinates? coordinates;

  Place({
    required this.name,
    required this.coordinates,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json["name"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "coordinates": coordinates!.toJson(),
      };
}
