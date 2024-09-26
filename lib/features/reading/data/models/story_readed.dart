// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StoryReaded {
  final String id;
  final List<String> storyIds;

  StoryReaded({required this.id, required this.storyIds});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'storyIds': storyIds,
    };
  }

  factory StoryReaded.fromMap(Map<String, dynamic> map) {
    return StoryReaded(
      id: map['id'] as String,
      storyIds: List<String>.from((map['storyIds'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryReaded.fromJson(String source) => StoryReaded.fromMap(json.decode(source) as Map<String, dynamic>);

  StoryReaded copyWith({
    String? id,
    List<String>? storyIds,
  }) {
    return StoryReaded(
      id: id ?? this.id,
      storyIds: storyIds ?? this.storyIds,
    );
  }
}
