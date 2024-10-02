// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:english_will_fly/features/dictionary/data/models/definition.dart';

class Meaning {
  String? partOfSpeech;
  List<Definition>? definitions;
  List<String>? synonyms;
  List<dynamic>? antonyms;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  Meaning copyWith({
    String? partOfSpeech,
    List<Definition>? definitions,
    List<String>? synonyms,
    List<String>? antonyms,
  }) =>
      Meaning(
        partOfSpeech: partOfSpeech ?? this.partOfSpeech,
        definitions: definitions ?? this.definitions,
        synonyms: synonyms ?? this.synonyms,
        antonyms: antonyms ?? this.antonyms,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partOfSpeech': partOfSpeech,
      'definitions': definitions?.map((x) => x.toMap()).toList(),
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }

  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      partOfSpeech: map['partOfSpeech'] ?? '',
      definitions: List<Definition>.from(
        (map['definitions'] as List<dynamic>).map<Definition>(
          (x) => Definition.fromMap(x as Map<String, dynamic>),
        ),
      ),
      synonyms: List<String>.from(map['synonyms'] ?? []), // Eğer `synonyms` boşsa, boş liste ata
      antonyms: List<String>.from(map['antonyms'] ?? []), // Eğer `antonyms` boşsa, boş liste ata
    );
  }

  String toJson() => json.encode(toMap());

  factory Meaning.fromJson(String source) => Meaning.fromMap(json.decode(source) as Map<String, dynamic>);
}
