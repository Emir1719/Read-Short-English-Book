import 'package:english_will_fly/core/dependency.dart';
import 'package:english_will_fly/features/auth/data/repository_impl/firestore_wordlist.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:english_will_fly/features/reading/domain/repository/i_word_list.dart';

class WordListRepository implements IWordList {
  // final _firestore = FirestoreWordlist(FirebaseFirestore.instance, FirebaseAuth.instance);
  final _firestore = getIt<FirestoreWordlist>();

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
