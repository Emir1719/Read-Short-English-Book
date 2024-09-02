import 'dart:convert';

import 'package:english_will_fly/features/reading/data/models/dictionary.dart';
import 'package:english_will_fly/features/reading/data/models/story_element.dart';
import 'package:flutter/services.dart';

/// Singleton yapısına sahip ve hikayeler hakkında işlem yapar
class StoryApi {
  static final _instance = StoryApi._();

  StoryApi._();

  factory StoryApi() => _instance;

  /// Seviyeye göre hikayeleri getirir
  Future<List<Story>> loadStoryData(String level) async {
    String path = 'assets/data/${level.trim().toLowerCase()}.json';
    final jsonString = await rootBundle.loadString(path);
    final jsonData = jsonDecode(jsonString) as List;

    return jsonData.map((e) => Story.fromMap(e)).toList();
  }

  List<String> getLevels() {
    return ["A1", "A2", "B1", "B2", "C1", "C2"];
  }

  Future<List<Dictionary>> loadDictionary() async {
    var path = "assets/data/dictionary.json";
    final jsonString = await rootBundle.loadString(path);
    final jsonData = jsonDecode(jsonString) as List;

    return Dictionary.fromJsonList(jsonData);
  }
}
