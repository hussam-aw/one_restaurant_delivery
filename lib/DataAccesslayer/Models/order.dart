import 'dart:convert';

class Order {
  final int id;
  final int userId;
  final num total;
  final int statusId;
  final String notes;
  final num discount;
  final int isDiscount;
  final String address;
  final num lat;
  final num long;
  final String createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.total,
    required this.statusId,
    required this.notes,
    required this.discount,
    required this.isDiscount,
    required this.address,
    required this.lat,
    required this.long,
    required this.createdAt,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int,
      userId: map['user_id'] ?? "",
      total: map['total'] ?? "",
      statusId: map['status_id'] ?? "",
      notes: map['notes'] ?? "",
      discount: map['discount'] ?? "",
      isDiscount: map['is_discount'] ?? "",
      address: map['address'] ?? "",
      lat: map['lat'] ?? "",
      long: map['long'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'total': total,
      'status_id': statusId,
      'notes': notes,
      'discount': discount,
      'is_discount': isDiscount,
      'address': address,
      'lat': lat,
      'long': long,
    };
  }

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
