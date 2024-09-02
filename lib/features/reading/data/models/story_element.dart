// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Story {
  final int id;
  final String title;
  final String image;
  final int category;
  final List<String> paragraphs;
  final List<String> definitions;

  Story({
    required this.id,
    required this.title,
    required this.paragraphs,
    required this.definitions,
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'category': category,
      'paragraphs': paragraphs,
      'definitions': definitions,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'] as int,
      title: map['title'] as String,
      image: map['image'] as String,
      category: map['category'] as int,
      paragraphs: List<String>.from((map['paragraphs'] as List<dynamic>)),
      definitions: List<String>.from((map['definitions'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source) as Map<String, dynamic>);
}
