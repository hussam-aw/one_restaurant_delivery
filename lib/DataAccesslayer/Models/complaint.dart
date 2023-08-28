import 'dart:convert';

class Complaint {
  final int id;
  final String description;
  final String replyMessage;
  final bool seen;
  final String createdAt;

  Complaint({
    required this.id,
    required this.description,
    required this.replyMessage,
    required this.seen,
    required this.createdAt,
  });

  factory Complaint.fromMap(Map<String, dynamic> map) {
    return Complaint(
      id: map['id'] as int,
      description: map['description'] ?? "",
      replyMessage: map['replyMessage'] ?? "",
      seen: map['seen'] == 1 ? true : false,
      createdAt: map['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'replyMessage': replyMessage,
      'seen': seen,
    };
  }

  factory Complaint.fromJson(String source) =>
      Complaint.fromMap(json.decode(source) as Map<String, dynamic>);
}
