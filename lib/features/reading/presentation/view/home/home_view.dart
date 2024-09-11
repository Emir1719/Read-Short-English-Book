import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/presentation/view/profile/profile_view.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home_level_list.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final api = StoryApi();
    List<String> levels = api.getLevels();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Seviyeler"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileView()),
              );
            },
          ),
        ],
      ),
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
