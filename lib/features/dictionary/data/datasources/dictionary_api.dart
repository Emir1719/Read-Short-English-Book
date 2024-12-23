import 'package:dio/dio.dart';
import 'package:english_will_fly/features/dictionary/data/models/dictionary.dart';

class DictionaryApi {
  // final String _baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";
  final _dio = Dio(BaseOptions(baseUrl: "https://api.dictionaryapi.dev/api/v2/entries/en/"));

  Future<List<Dictionary>> getMean(String word) async {
    try {
      final response = await _dio.get(word.trim().toLowerCase());

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((entry) => Dictionary.fromMap(entry as Map<String, dynamic>)).toList();
      }

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
