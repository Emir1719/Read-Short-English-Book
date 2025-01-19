import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_reading.dart';
import 'package:english_will_fly/features/reading/data/models/story_readed.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreReading implements IFirestoreReading {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final String _readingCol = "reading";

  FirestoreReading(this._firestore, this._auth);

  String get _userId => _auth.currentUser!.uid;

  @override
  Future<bool> saveLiked(String storyId) async {
    try {
      // Reference to the user's document
      final docRef = _firestore.collection(_readingCol).doc(_userId);

      // Check if the document exists
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // If the document exists, update the list
        await docRef.update({
          "storyIds": FieldValue.arrayUnion([storyId])
        });
      } else {
        // If the document doesn't exist, create it with the storyId
        await docRef.set({
          "id": _userId,
          "storyIds": [storyId]
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<StoryReaded?> getAllReading() async {
    try {
      final snapshot = await _firestore.collection(_readingCol).doc(_userId).get();
      if (snapshot.data() == null) {
        return null;
      }
      final data = snapshot.data() as Map<String, dynamic>;
      return StoryReaded.fromMap(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> unsaveLiked(String storyId) async {
    try {
      // Reference to the user's document
      final docRef = _firestore.collection(_readingCol).doc(_userId);

      // Check if the document exists
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        await docRef.update({
          "storyIds": FieldValue.arrayRemove([storyId]),
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
