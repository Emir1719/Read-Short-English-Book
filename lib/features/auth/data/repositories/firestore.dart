// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_repository.dart';
import 'package:english_will_fly/features/reading/data/models/story_readed.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRepository implements IFirestoreRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final String _usersCol = "users";
  final String _readingCol = "reading";
  final String _wordListCol = "word_list";

  FirestoreRepository(this._firestore, this._auth);

  String get _userId => _auth.currentUser!.uid;

  @override
  Future<AppUser?> getCurrentUser(String userId) async {
    try {
      final docSnapshot = await _firestore.collection(_usersCol).doc(userId).get();
      if (docSnapshot.exists) {
        return AppUser.fromFirestore(docSnapshot);
      }
      return null;
    } catch (e) {
      print("Error: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<bool> saveUser(User firebaseUser, String age) async {
    try {
      final appUser = AppUser(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '', // Use an empty string if email is null
        age: age,
      );

      // Save the AppUser to Firestore
      await _firestore.collection(_usersCol).doc(appUser.id).set(appUser.toMap());
      return true;
    } catch (e) {
      // Log error or handle accordingly
      print("Error: ${e.toString()}");
      return false;
    }
  }

  @override
  Future<bool> saveReading(String storyId) async {
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
      print("Error: ${e.toString()}");
      return false;
    }
  }

  @override
  Future<StoryReaded> getAllReading() async {
    try {
      final snapshot = await _firestore.collection(_readingCol).doc(_userId).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return StoryReaded.fromMap(data);
    } catch (e) {
      print("Error: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<WordList?> getAllWordFromList() async {
    try {
      final snapshot = await _firestore.collection(_wordListCol).doc(_userId).get();
      final data = snapshot.data();

      return data == null ? null : WordList.fromMap(data);
    } catch (e) {
      print("Error: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<bool> saveWordToList(String word) async {
    try {
      final docRef = _firestore.collection(_wordListCol).doc(_userId);
      final snapshot = await docRef.get();

      final wordList = WordList(id: _userId, words: [word]);

      if (snapshot.exists) {
        await docRef.update({
          "words": FieldValue.arrayUnion([word])
        });
      } else {
        await docRef.set(wordList.toMap());
      }
      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      return false;
    }
  }

  @override
  Future<bool> removeWordFromList(String word) async {
    try {
      final docRef = _firestore.collection(_wordListCol).doc(_userId);

      await docRef.update({
        'words': FieldValue.arrayRemove([word])
      });

      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      return false;
    }
  }
}
