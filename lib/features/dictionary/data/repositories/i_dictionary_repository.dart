import 'package:english_will_fly/features/dictionary/data/models/dictionary.dart';

abstract class IDictionaryRepository {
  Future<List<Dictionary>> getMean(String word);
}
