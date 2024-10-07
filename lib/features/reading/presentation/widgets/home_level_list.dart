import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/view/stories/stories_view.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_level_subtitle.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeStoryLevelList extends StatelessWidget {
  const HomeStoryLevelList({super.key, required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<ReadingBloc>().add(FetchStories(levelCode: level));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => StoriesView(level: level)));
      },
      child: Container(
        decoration: AppStyle.level,
        child: ListTile(
          contentPadding: AppPadding.storyLevel,
          title: Text(level, style: AppStyle.levelTitle),
          trailing: CircleAvatar(
            radius: 8,
            backgroundColor: AppStyle.levelColor(level.toLowerCase()),
          ),
          subtitle: StoryLevelSubtitle(level: level),
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(Icons.book, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
