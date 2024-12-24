import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home_level_list.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class StoryLevelView extends StatelessWidget {
  const StoryLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    final api = StoryApi();
    List<String> levels = api.getLevels();

    return Scaffold(
      appBar: AppBar(title: Text("storyLevel.title").tr()),
      body: GridView.builder(
        padding: AppPadding.defaults,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          var level = levels[index];

          return HomeStoryLevelList(level: level);
        },
      ),
    );
  }
}
