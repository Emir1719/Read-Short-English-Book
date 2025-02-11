import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_detail/story_chapter_item.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryChaptersDrawer extends StatelessWidget {
  const StoryChaptersDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<StoryReadBloc>().state as StoryReadLoaded;

    return SafeArea(
      child: Drawer(
        child: ListView.separated(
          itemCount: bloc.story.chapters.length,
          padding: EdgeInsets.symmetric(vertical: 15),
          separatorBuilder: (context, index) => Divider(
            color: context.color.surfaceContainerLowest,
            height: 1,
          ),
          itemBuilder: (context, index) {
            return StoryChapterItem(chapter: bloc.story.chapters[index]);
          },
        ),
      ),
    );
  }
}
