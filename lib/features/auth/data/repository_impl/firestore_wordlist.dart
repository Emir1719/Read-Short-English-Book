import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_wordlist.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreWordlist implements IFirestoreWordlist {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final String _wordListCol = "word_list";
  String get _userId => _auth.currentUser!.uid;

  FirestoreWordlist(this._firestore, this._auth);

  @override
  Future<WordList?> getAllWordFromList() async {
    try {
      final snapshot = await _firestore.collection(_wordListCol).doc(_userId).get();
      final data = snapshot.data();

      return data == null ? null : WordList.fromMap(data);
    } catch (e) {
      throw Exception("WordList error: $e");
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
      throw Exception("WordList error: $e");
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
      throw Exception("WordList error: $e");
    }
  }
}
