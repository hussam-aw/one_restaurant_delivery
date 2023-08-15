import 'dart:convert';

class Category {
  final int id;
  final String name;
  final String image;
  final int parentId;
  final String createdAt;
 
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.createdAt,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        id: map['id'] as int,
        name: map['name'] ?? "",
        image: map['image'] ?? "",
        parentId: map['parent_id'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }

    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'parent_id': parentId,
    };
  }

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

}
