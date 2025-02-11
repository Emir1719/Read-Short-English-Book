import 'package:english_will_fly/core/dependency.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_wordlist.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:english_will_fly/features/reading/domain/repository/i_word_list.dart';

class WordListRepository implements IWordList {
  final _firestore = getIt<IFirestoreWordlist>();

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
