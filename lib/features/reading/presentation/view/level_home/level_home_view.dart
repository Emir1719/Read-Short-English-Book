import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home_level_list.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class StoryLevelHomeView extends StatelessWidget {
  const StoryLevelHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final api = StoryApi();
    List<String> levels = api.getLevels();

    return Scaffold(
      appBar: AppBar(title: const Text("Seviyeler")),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        padding: AppPadding.defaults,
        itemCount: levels.length,
        itemBuilder: (context, index) {
          var level = levels[index];

          return HomeStoryLevelList(level: level);
        },
      ),
    );
  }
}
