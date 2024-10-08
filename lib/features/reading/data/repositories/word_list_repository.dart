import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/repositories/firestore.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:english_will_fly/features/reading/domain/repository/i_word_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WordListRepository implements IWordList {
  final _firestore = FirestoreRepository(FirebaseFirestore.instance, FirebaseAuth.instance);

  @override
  Future<WordList?> getAllWords() async {
    return await _firestore.getAllWordFromList();
  }

  @override
  Future<bool> saveWord(String word) async {
    return await _firestore.saveWordToList(word);
  }

  @override
  Future<bool> removeWord(String word) async {
    return await _firestore.removeWordFromList(word);
  }
}
