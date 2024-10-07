import 'package:english_will_fly/features/reading/data/models/word_list.dart';

abstract class IWordList {
  Future<WordList> getAllWords();
  Future<bool> saveWord(String word);
}
