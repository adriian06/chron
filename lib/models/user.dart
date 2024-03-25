import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String id;
  final String email;
  final DateTime createdAt;

  UserData({required this.id, required this.email, required this.createdAt});

  factory UserData.fromMap(Map<String, dynamic> data, String documentId) {
    String email = data['email'];
    DateTime createdAt = (data['createdAt'] as Timestamp).toDate();

    return UserData(id: documentId, email: email, createdAt: createdAt);
  }

  UserData copyWith({String? id, String? email, DateTime? createdAt}) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
