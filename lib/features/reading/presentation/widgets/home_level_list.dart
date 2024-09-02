import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/view/stories/stories_view.dart';
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoriesView(level: level)));
      },
      child: Container(
        decoration: AppStyle.level,
        child: ListTile(
          title: Text(level, style: AppStyle.levelTitle),
          trailing: CircleAvatar(
            radius: 10,
            backgroundColor: AppStyle.levelColor(level.toLowerCase()),
          ),
        ),
      ),
    );
  }
}
