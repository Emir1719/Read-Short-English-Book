import 'package:english_will_fly/features/reading/data/models/story_readed.dart';

abstract class IFirestoreReading {
  Future<bool> saveLiked(String storyId);
  Future<bool> unsaveLiked(String storyId);
  Future<StoryReaded?> getAllReading();
}
