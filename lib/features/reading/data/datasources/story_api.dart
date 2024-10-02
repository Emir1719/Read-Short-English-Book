import 'dart:convert';

import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
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

  /// hikayeleri getirir
  Future<List<Story>> loadAllStoriesData() async {
    List<dynamic> jsonData = [];

    // Paralel olarak bütün dosyaları yüklemek için Future kullanıyoruz.
    var futures = getLevels().map((level) async {
      String path = 'assets/data/${level.trim().toLowerCase()}.json';
      final jsonString = await rootBundle.loadString(path);
      return jsonDecode(jsonString) as List;
    });

    // Tüm işlemleri bekliyoruz ve sonuçları listeye ekliyoruz.
    var results = await Future.wait(futures);

    // Sonuçları düz bir listeye dönüştürüyoruz.
    for (var result in results) {
      jsonData += result;
    }

    return jsonData.map((e) => Story.fromMap(e)).toList();
  }

  List<String> getLevels() {
    return ["A1", "A2", "B1", "B2", "C1", "C2"];
  }

  Future<List<Category>> loadCategories() async {
    String path = 'assets/data/category.json';
    final jsonString = await rootBundle.loadString(path);
    final jsonData = jsonDecode(jsonString) as List;

    return jsonData.map((e) => Category.fromMap(e)).toList();
  }
}
