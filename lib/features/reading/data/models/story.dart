// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:english_will_fly/features/reading/data/models/story_element.dart';

class Story {
  final String title;
  final List<StoryElement> stories;

  Story({
    required this.title,
    required this.stories,
  });

  Story copyWith({
    String? title,
    List<StoryElement>? stories,
  }) =>
      Story(
        title: title ?? this.title,
        stories: stories ?? this.stories,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'stories': stories.map((x) => x.toMap()).toList(),
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      title: map['title'] as String,
      stories: List<StoryElement>.from(
        (map['stories'] as List).map<StoryElement>(
          (x) => StoryElement.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source) as Map<String, dynamic>);
}
