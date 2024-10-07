import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_repository.dart';
import 'package:english_will_fly/features/reading/data/models/story_readed.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRepository implements IFirestoreRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final String _usersCollection = "users";
  final String _readingCollection = "reading";
  final String _wordListCollection = "word_list";

  FirestoreRepository(this._firestore, this._auth);

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

  @override
  Future<bool> saveReading(String storyId) async {
    try {
      final id = _auth.currentUser!.uid;

      // Reference to the user's document
      final docRef = _firestore.collection(_readingCollection).doc(id);

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
          "id": id,
          "storyIds": [storyId]
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<StoryReaded> getAllReading() async {
    try {
      final snapshot =
          await _firestore.collection(_readingCollection).doc(_auth.currentUser!.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return StoryReaded.fromMap(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WordList> getAllWordFromList() async {
    try {
      final userId = _auth.currentUser!.uid;
      final snapshot = await _firestore.collection(_wordListCollection).doc(userId).get();
      final data = snapshot.data()!;

      return WordList.fromMap(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveWordToList(String word) async {
    try {
      final userId = _auth.currentUser!.uid;
      final docRef = _firestore.collection(_wordListCollection).doc(userId);
      final snapshot = await docRef.get();

      WordList wordList = WordList(id: userId, words: [word]);

      if (snapshot.exists) {
        await docRef.update({
          "words": FieldValue.arrayUnion([word])
        });
      } else {
        await docRef.set(wordList.toMap());
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
