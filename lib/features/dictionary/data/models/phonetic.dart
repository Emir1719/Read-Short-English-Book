// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:english_will_fly/features/dictionary/data/models/lisence.dart';

class Phonetic {
  String? text;
  String? audio;
  String? sourceUrl;
  License? license;

  Phonetic({
    required this.audio,
    required this.sourceUrl,
    required this.license,
    required this.text,
  });

  Phonetic copyWith({
    String? audio,
    String? sourceUrl,
    License? license,
    String? text,
  }) =>
      Phonetic(
        audio: audio ?? this.audio,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        license: license ?? this.license,
        text: text ?? this.text,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'audio': audio,
      'sourceUrl': sourceUrl,
      'license': license?.toMap(),
      'text': text,
    };
  }

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
      text: map['text'] ?? '',
      audio: map['audio'], // `null` olabilir
      sourceUrl: map['sourceUrl'], // `null` olabilir
      license: map['license'] != null ? License.fromMap(map['license']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phonetic.fromJson(String source) => Phonetic.fromMap(json.decode(source) as Map<String, dynamic>);
}
