// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Definition {
  String? definition;
  List<dynamic>? synonyms;
  List<dynamic>? antonyms;
  String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  Definition copyWith({
    String? definition,
    List<dynamic>? synonyms,
    List<dynamic>? antonyms,
    String? example,
  }) =>
      Definition(
        definition: definition ?? this.definition,
        synonyms: synonyms ?? this.synonyms,
        antonyms: antonyms ?? this.antonyms,
        example: example ?? this.example,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'definition': definition,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'example': example,
    };
  }

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
      definition: map['definition'] ?? '',
      synonyms: List<String>.from(map['synonyms'] ?? []), // Eğer `synonyms` boşsa, boş liste ata
      antonyms: List<String>.from(map['antonyms'] ?? []), // Eğer `antonyms` boşsa, boş liste ata
      example: map['example'], // `null` olabilir
    );
  }

  String toJson() => json.encode(toMap());

  factory Definition.fromJson(String source) => Definition.fromMap(json.decode(source) as Map<String, dynamic>);
}
