import 'dart:convert';

import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:flutter/services.dart';

/// Singleton yapısına sahip ve hikayeler hakkında işlem yapar
class StoryApi {
  static final _instance = StoryApi._();
  StoryApi._();
  factory StoryApi() => _instance;

  /// Seviyeye göre hikayeleri jsondan getirir
  Future<List<Story>> getAllStories() async {
    final jsonString = await rootBundle.loadString('assets/data/stories.json');
    final jsonData = jsonDecode(jsonString) as List;

    return jsonData.map((e) => Story.fromMap(e)).toList();
  }

  List<String> getLevels() {
    return ["A1", "A2", "B1", "B2", "C1", "C2"];
  }

  Future<List<Category>> getAllCategories() async {
    final jsonString = await rootBundle.loadString('assets/data/category.json');
    final jsonData = jsonDecode(jsonString) as List;

    return jsonData.map((e) => Category.fromMap(e)).toList();
  }
}
