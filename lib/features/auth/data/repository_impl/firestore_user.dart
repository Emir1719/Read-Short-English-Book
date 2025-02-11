// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUser implements IFirestoreUser {
  final FirebaseFirestore _firestore;
  final String _usersCol = "users";

  FirestoreUser(this._firestore);

  @override
  Future<AppUser?> getCurrentUser(String userId) async {
    try {
      final docSnapshot = await _firestore.collection(_usersCol).doc(userId).get();
      if (docSnapshot.exists) {
        return AppUser.fromFirestore(docSnapshot);
      }
      return null;
    } catch (e) {
      throw Exception("Auth Error. $e");
    }
  }

  @override
  Future<bool> saveUser(User firebaseUser) async {
    try {
      final appUser = AppUser(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '', // Use an empty string if email is null
      );

      // Save the AppUser to Firestore
      await _firestore.collection(_usersCol).doc(appUser.id).set(appUser.toMap());
      return true;
    } catch (e) {
      throw Exception("Auth Error. $e");
    }
  }
}
