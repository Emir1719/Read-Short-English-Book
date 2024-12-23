// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  final int id;
  final String title;
  final String description;
  final String iconName;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.iconName,
  });

  factory Category.getById(int id) {
    return Category(
      id: id,
      title: '',
      description: '',
      iconName: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'icon': iconName,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      iconName: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
