import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRepository implements IFirestoreRepository {
  final FirebaseFirestore _firestore;
  final String _usersCollection = "users";

  FirestoreRepository(this._firestore);

  @override
  Future<AppUser?> getCurrentUser(String userId) async {
    try {
      final docSnapshot = await _firestore.collection(_usersCollection).doc(userId).get();
      if (docSnapshot.exists) {
        return AppUser.fromFirestore(docSnapshot);
      }
      return null;
    } catch (e) {
      // Log error or handle accordingly
      rethrow; // Optional: rethrow the error if you want to handle it at a higher level
    }
  }

  @override
  Future<bool> saveUser(User firebaseUser, String age) async {
    try {
      // Create an AppUser instance using the Firebase User
      final appUser = AppUser(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '', // Use an empty string if email is null
        age: age,
      );

      // Save the AppUser to Firestore
      await _firestore.collection(_usersCollection).doc(appUser.id).set(appUser.toMap());
      return true;
    } catch (e) {
      // Log error or handle accordingly
      return false;
    }
  }
}
