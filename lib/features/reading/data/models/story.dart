// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:english_will_fly/features/reading/data/models/category.dart';

class Story {
  final String id;
  final String title;
  final String image;
  final String level;
  final Category category;
  final List<String> paragraphs;
  final List<String> definitions;
  bool isCompleted;

  Story({
    required this.id,
    required this.title,
    required this.paragraphs,
    required this.definitions,
    required this.image,
    required this.level,
    required this.category,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'category': category.id,
      'paragraphs': paragraphs,
      'definitions': definitions,
      'isCompleted': isCompleted,
      'level': level,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    // category and isCompleted placeholder, namely these fields will be changed in the bloc file

    return Story(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      category: Category.getById(map['category'] as int),
      paragraphs: List<String>.from((map['paragraphs'] as List<dynamic>)),
      definitions: List<String>.from((map['definitions'] as List<dynamic>)),
      isCompleted: false,
      level: "a1",
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) =>
      Story.fromMap(json.decode(source) as Map<String, dynamic>);

  Story copyWith({
    String? id,
    String? title,
    String? image,
    String? level,
    Category? category,
    List<String>? paragraphs,
    List<String>? definitions,
    bool? isCompleted,
  }) {
    return Story(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      level: level ?? this.level,
      category: category ?? this.category,
      paragraphs: paragraphs ?? this.paragraphs,
      definitions: definitions ?? this.definitions,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
