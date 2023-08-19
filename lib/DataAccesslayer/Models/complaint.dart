import 'dart:convert';

class Complaint {
  final int id;
  final int userId;
  final String description;
  final String replyMessage;
  final int seen;
  final String createdAt;

  Complaint({
    required this.id,
    required this.userId,
    required this.description,
    required this.replyMessage,
    required this.seen,
    required this.createdAt,
  });

  factory Complaint.fromMap(Map<String, dynamic> map) {
    return Complaint(
      id: map['id'] as int,
      userId: map['user_id'] ?? "",
      description: map['description'] ?? "",
      replyMessage: map['replyMessage'] ?? "",
      seen: map['seen'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'description': description,
      'replyMessage': replyMessage,
      'seen': seen,
    };
  }

  factory Complaint.fromJson(String source) =>
      Complaint.fromMap(json.decode(source) as Map<String, dynamic>);
}
