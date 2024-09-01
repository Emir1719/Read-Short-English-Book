import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late StoryApi api;

  setUp(() {
    api = StoryApi();
  });

  group("for dictionary", () {
    test("does this function come searched word correctly?", () async {
      final dictionary = await api.loadDictionary();
      expect(dictionary.first.mean, "hissetmek");
    });

    test("Does this function come with searched words in the correct structure?", () async {
      final dictionary = await api.loadDictionary();
      expect(
        dictionary.first.toMap(),
        {"word": "feel", "mean": "hissetmek"},
      );
    });
  });
}
