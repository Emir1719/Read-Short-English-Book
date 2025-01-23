import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/domain/repository/istory.dart';

final class StoryRepository extends IStory {
  final _api = StoryApi();

  @override
  Future<List<Category>> getCategories() async {
    return await _api.getAllCategories();
  }

  @override
  Future<List<Story>> getAllStories() async {
    return await _api.getAllStories();
  }

  @override
  Future<List<Story>> getStoriesWithCategories() async {
    var stories = await _api.getAllStories();
    var categories = await _api.getAllCategories();

    // Hikayeleri kategorilerle eşleştir
    var storiesWithCategories = stories.map((story) {
      var category = categories.firstWhere((category) => category.id == story.category.id);

      return Story(
        id: story.id,
        title: story.title,
        category: category,
        image: story.image,
        level: story.level,
        authorId: story.authorId,
        chapters: story.chapters,
        createdAt: story.createdAt,
        updatedAt: story.updatedAt,
        isLiked: story.isLiked,
      );
    }).toList();

    return storiesWithCategories;
  }
}
