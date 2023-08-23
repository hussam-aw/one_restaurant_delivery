import 'dart:convert';

import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';

class Offer {
  final int id;
  final  Meal meal;
  final String image;
  final String createdAt;
 
  Offer({
    required this.id,
    required this.meal,
    required this.image,
    required this.createdAt,
  });

  factory Offer.fromMap(Map<String, dynamic> map) {
    return Offer(
        id: map['id'] as int,
        meal: Meal.fromMap(map['meal']),
        image: map['image'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }

  //   Map<String, dynamic> toMap() {
  //   return {
  //     'meal': meal,
  //     'image': image,
  //   };
  // }

  factory Offer.fromJson(String source) =>
      Offer.fromMap(json.decode(source) as Map<String, dynamic>);

}
