import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/home_level_image.dart';
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
      onTap: () {
        context.read<ReadingBloc>().add(FetchStories(levelCode: level));
        context.push("/stories?level=$level");
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.color.surface,
          border: Border.all(color: context.color.surfaceContainerLow),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeLevelImage(level: level),
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 16),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Color(0xff128c7f),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Text(
                level,
                style: context.text.titleMedium?.copyWith(color: context.color.surface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
