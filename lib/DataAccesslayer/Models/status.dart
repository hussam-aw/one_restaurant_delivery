import 'dart:convert';

class Status {
  final int id;
  final String name;
  final int order;
  final String createdAt;
 
  Status({
    required this.id,
    required this.name,
    required this.order,
    required this.createdAt,
  });

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
        id: map['id'] as int,
        name: map['name'] ?? "",
        order: map['order'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }

    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'order': order,
    };
  }

  factory Status.fromJson(String source) =>
      Status.fromMap(json.decode(source) as Map<String, dynamic>);

}
