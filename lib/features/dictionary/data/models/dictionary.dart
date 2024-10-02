// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:english_will_fly/features/dictionary/data/models/lisence.dart';
import 'package:english_will_fly/features/dictionary/data/models/meaning.dart';
import 'package:english_will_fly/features/dictionary/data/models/phonetic.dart';

class Dictionary {
  String? word;
  List<Phonetic>? phonetics;
  List<Meaning>? meanings;
  License? license;
  List<String>? sourceUrls;

  Dictionary({
    required this.word,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  Dictionary copyWith({
    String? word,
    List<Phonetic>? phonetics,
    List<Meaning>? meanings,
    License? license,
    List<String>? sourceUrls,
  }) =>
      Dictionary(
        word: word ?? this.word,
        phonetics: phonetics ?? this.phonetics,
        meanings: meanings ?? this.meanings,
        license: license ?? this.license,
        sourceUrls: sourceUrls ?? this.sourceUrls,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'phonetics': phonetics?.map((x) => x.toMap()).toList(),
      'meanings': meanings?.map((x) => x.toMap()).toList(),
      'license': license?.toMap(),
      'sourceUrls': sourceUrls,
    };
  }

  factory Dictionary.fromMap(Map<String, dynamic> map) {
    return Dictionary(
      word: map['word'] ?? '', // `word` boşsa boş string olarak ata
      phonetics: List<Phonetic>.from(
        (map['phonetics'] as List<dynamic>).map<Phonetic>(
          (x) => Phonetic.fromMap(x as Map<String, dynamic>),
        ),
      ),
      meanings: List<Meaning>.from(
        (map['meanings'] as List<dynamic>).map<Meaning>(
          (x) => Meaning.fromMap(x as Map<String, dynamic>),
        ),
      ),
      license: map['license'] != null ? License.fromMap(map['license']) : null, // `license` `null` olabilir
      sourceUrls: List<String>.from(map['sourceUrls'] ?? []), // `sourceUrls` boşsa boş liste ata
    );
  }

  String toJson() => json.encode(toMap());

  factory Dictionary.fromJson(String source) => Dictionary.fromMap(json.decode(source) as Map<String, dynamic>);
}
