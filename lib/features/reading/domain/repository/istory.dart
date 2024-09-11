import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';

abstract class IStory {
  /// Seviye koduna göre tüm hikayeleri getirir
  Future<List<Story>> getStoriesByLevelCode(String levelCode);

  /// Tüm kategorileri getirir
  Future<List<Category>> getCategories();

  /// Seviye koduna göre tüm hikayeleri, kategori id'si ile eşleştirip getirir
  Future<List<Story>> getStoriesWithCategories(String levelCode);
}
