// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dictionary {
  final String word;
  final String mean;

  Dictionary({required this.word, required this.mean});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'mean': mean,
    };
  }

  factory Dictionary.fromMap(Map<String, dynamic> map) {
    return Dictionary(
      word: map['word'] as String,
      mean: map['mean'] as String,
    );
  }

  static List<Dictionary> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => Dictionary.fromMap(item)).toList();
  }

  String toJson() => json.encode(toMap());

  factory Dictionary.fromJson(String source) => Dictionary.fromMap(json.decode(source) as Map<String, dynamic>);
}
