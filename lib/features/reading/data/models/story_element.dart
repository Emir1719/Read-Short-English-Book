import 'dart:convert';

class StoryElement {
  final int id;
  final String title;
  final String image;
  final List<String> paragraphs;
  final List<String> definitions;

  StoryElement({
    required this.id,
    required this.title,
    required this.paragraphs,
    required this.definitions,
    required this.image,
  });

  StoryElement copyWith({
    int? id,
    String? title,
    List<String>? paragraphs,
    List<String>? definitions,
  }) =>
      StoryElement(
        id: id ?? this.id,
        title: title ?? this.title,
        paragraphs: paragraphs ?? this.paragraphs,
        definitions: definitions ?? this.definitions,
        image: image,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'paragraphs': paragraphs,
      'definitions': definitions,
      "image": image,
    };
  }

  factory StoryElement.fromMap(Map<String, dynamic> map) {
    return StoryElement(
      id: map['id'] as int,
      title: map['title'] as String,
      paragraphs: List<String>.from(map['paragraphs'] as List),
      definitions: List<String>.from(map['definitions'] as List),
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryElement.fromJson(String source) => StoryElement.fromMap(json.decode(source) as Map<String, dynamic>);
}
