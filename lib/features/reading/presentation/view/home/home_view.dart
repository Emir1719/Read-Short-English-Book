import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/view/stories/stories_view.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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

          return GestureDetector(
            onTap: () async {
              context.read<ReadingBloc>().add(FetchStories(levelCode: level));
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StoriesView()));
            },
            child: Container(
              decoration: AppStyle.level,
              child: ListTile(
                title: Text(level, style: AppStyle.levelTitle),
                trailing: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppStyle.levelColor(index),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
