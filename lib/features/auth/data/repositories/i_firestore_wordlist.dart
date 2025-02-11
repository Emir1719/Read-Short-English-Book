import 'package:english_will_fly/features/reading/data/models/word_list.dart';

abstract class IFirestoreWordlist {
  Future<bool> saveWordToList(String word);
  Future<bool> removeWordFromList(String word);
  Future<WordList?> getAllWordFromList();
}
