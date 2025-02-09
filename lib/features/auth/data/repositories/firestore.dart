// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_repository.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRepository implements IFirestoreRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final String _usersCol = "users";
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
      // Log error or handle accordingly
      print("Error: ${e.toString()}");
      return false;
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
