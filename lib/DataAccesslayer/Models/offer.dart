import 'dart:convert';

class Offer {
  final int id;
  final int mealId;
  final String image;
  final String createdAt;
 
  Offer({
    required this.id,
    required this.mealId,
    required this.image,
    required this.createdAt,
  });

  factory Offer.fromMap(Map<String, dynamic> map) {
    return Offer(
        id: map['id'] as int,
        mealId: map['meal'] ?? "",
        image: map['image'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }

    Map<String, dynamic> toMap() {
    return {
      'meal': mealId,
      'image': image,
    };
  }

  factory Offer.fromJson(String source) =>
      Offer.fromMap(json.decode(source) as Map<String, dynamic>);

}
