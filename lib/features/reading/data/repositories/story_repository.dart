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
        paragraphs: story.paragraphs,
        definitions: story.definitions,
      );
    }).toList();

    return storiesWithCategories;
  }
}