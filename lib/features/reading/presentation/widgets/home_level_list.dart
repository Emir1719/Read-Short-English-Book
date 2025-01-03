import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/home_level_image.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_level_subtitle.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeStoryLevelList extends StatelessWidget {
  const HomeStoryLevelList({super.key, required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<ReadingBloc>().add(FetchStories(levelCode: level));
        context.push("/stories?level=$level");
      },
      child: Container(
        decoration: AppStyle.level,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeLevelImage(level: level),
            ListTile(
              contentPadding: AppPadding.storyLevel,
              title: Text(level, style: context.text.bodyLarge),
              subtitle: StoryLevelSubtitle(level: level),
            ),
          ],
        ),
      ),
    );
  }
}
