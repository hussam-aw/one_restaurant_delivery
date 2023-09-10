class User {
  int id;
  int roleId;
  String name;
  String email;
  String avatar;
  String locale;
  DateTime createdAt;
  DateTime updatedAt;
  String address;
  String phone;

  User({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.avatar,
    required this.locale,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        locale: json["settings"]["locale"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        address: json["address"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "avatar": avatar,
        "locale": locale,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "address": address,
        "phone": phone,
      };
}
