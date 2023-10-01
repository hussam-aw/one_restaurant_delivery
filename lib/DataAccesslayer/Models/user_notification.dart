class UserNotification {
  int id;
  String title;
  String subtitle;
  String type;
  int data;
  String date;
  DateTime createdAt;

  UserNotification({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.data,
    required this.date,
    required this.createdAt,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      UserNotification(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        type: json["type"],
        data: json["data"],
        date: json["date"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "type": type,
        "data": data,
        "date": date,
        "created_at": createdAt.toIso8601String(),
      };
}
