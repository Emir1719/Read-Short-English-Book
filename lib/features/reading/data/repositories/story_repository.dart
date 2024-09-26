import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/domain/repository/istory.dart';

final class StoryRepository extends IStory {
  final _api = StoryApi();

  @override
  Future<List<Category>> getCategories() async {
    return await _api.loadCategories();
  }

  @override
  Future<List<Story>> getStoriesByLevelCode(String levelCode) async {
    return await _api.loadStoryData(levelCode.trim().toLowerCase());
  }

  @override
  Future<List<Story>> getStoriesWithCategoriesForAllLevels() async {
    List<Story> allStories = [];

    // Get levels with non-empty files
    var levels = _api.getLevels();

    // Her level için hikayeleri yükle
    for (var levelCode in levels) {
      var stories = await _api.loadStoryData(levelCode);
      var categories = await _api.loadCategories();

      // Hikayeleri kategorilerle eşleştir
      var storiesWithCategories = stories.map((story) {
        var category = categories.firstWhere((category) => category.id == story.category.id);

        return Story(
          id: story.id,
          title: story.title,
          category: category, // Eşleştirilmiş kategori
          image: story.image,
          level: levelCode.toLowerCase(),
          paragraphs: story.paragraphs,
          definitions: story.definitions,
        );
      }).toList();

      // Her level'dan gelen hikayeleri genel listeye ekle
      allStories.addAll(storiesWithCategories);
    }

    return allStories;
  }

  @override
  Future<List<Story>> getStoriesWithCategories(String levelCode) async {
    var stories = await _api.loadStoryData(levelCode);
    var categories = await _api.loadCategories();

    // Hikayeleri kategorilerle eşleştir
    var storiesWithCategories = stories.map((story) {
      var category = categories.firstWhere((category) => category.id == story.category.id);

      return Story(
        id: story.id,
        title: story.title,
        category: category, // Eşleştirilmiş kategori
        image: story.image,
        level: levelCode.toLowerCase(),
        paragraphs: story.paragraphs,
        definitions: story.definitions,
      );
    }).toList();

    return storiesWithCategories;
  }
}
