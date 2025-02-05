import 'dart:convert';

import 'package:english_will_fly/features/reading/data/models/category.dart';

import 'chapter.dart'; // Chapter modelinin de import edilmesi gerektiğini unutmayın

class Story {
  final String id;
  final String title;
  final String thumbnail;
  final String level;
  final String? authorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Category category;
  final List<Chapter> chapters;
  bool isLiked;

  Story({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.level,
    this.authorId,
    this.createdAt,
    this.updatedAt,
    required this.category,
    required this.chapters,
    this.isLiked = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'level': level,
      'authorId': authorId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'category': category.id,
      'chapters': chapters.map((x) => x.toMap()).toList(),
      'isLiked': isLiked,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'] as String,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      level: map['level'] ?? "a1",
      authorId: map['authorId'] as String?,
      createdAt: map['createdAt'] != null ? DateTime.tryParse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.tryParse(map['updatedAt']) : null,
      category: Category.getById(map['category'] as int),
      chapters: List<Chapter>.from(map['chapters']?.map((x) => Chapter.fromMap(x)) ?? []),
      isLiked: map['isLiked'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) =>
      Story.fromMap(json.decode(source) as Map<String, dynamic>);

  Story copyWith({
    String? id,
    String? title,
    String? thumbnail,
    String? level,
    String? authorId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Category? category,
    List<Chapter>? chapters,
    bool? isLiked,
  }) {
    return Story(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      level: level ?? this.level,
      authorId: authorId ?? this.authorId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
      chapters: chapters ?? this.chapters,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
