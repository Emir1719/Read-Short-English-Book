import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_list_item.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key, required this.state});
  final ReadingLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      padding: AppPadding.defaults,
      itemCount: state.story.length,
      itemBuilder: (context, index) {
        var story = state.story[index];

        return StoryListItem(story: story);
      },
    );
  }
}
