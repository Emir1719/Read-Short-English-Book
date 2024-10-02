// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:english_will_fly/features/dictionary/data/datasources/dictionary_api.dart';
import 'package:english_will_fly/features/dictionary/data/models/dictionary.dart';
import 'package:english_will_fly/features/dictionary/data/repositories/i_dictionary_repository.dart';

class DictionaryRepository extends IDictionaryRepository {
  DictionaryApi api;

  DictionaryRepository({required this.api});

  @override
  Future<List<Dictionary>> getMean(String word) async {
    return await api.getMean(word);
  }
}
