// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String id;
  final String email;
  String age;

  AppUser({required this.id, required this.email, required this.age});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'age': age,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty || !map.containsKey('id') || !map.containsKey('email')) {
      throw ArgumentError('Invalid map data');
    }

    return AppUser(
      id: map['id'] as String,
      email: map['email'] as String,
      age: map['age'] as String,
    );
  }

  factory AppUser.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AppUser.fromMap(data);
  }

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(
      id: user.uid,
      email: user.email ?? "",
      age: "",
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
