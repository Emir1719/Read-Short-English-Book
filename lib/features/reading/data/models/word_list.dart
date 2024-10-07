// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WordList {
  final String id;
  final List<String> words;

  WordList({required this.id, required this.words});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'words': words,
    };
  }

  factory WordList.fromMap(Map<String, dynamic> map) {
    return WordList(
      id: map['id'] as String,
      words: List<String>.from((map['words'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory WordList.fromJson(String source) =>
      WordList.fromMap(json.decode(source) as Map<String, dynamic>);

  WordList copyWith({
    String? id,
    List<String>? words,
  }) {
    return WordList(
      id: id ?? this.id,
      words: words ?? this.words,
    );
  }
}
