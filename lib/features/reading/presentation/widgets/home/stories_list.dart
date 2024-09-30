import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/categories.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_list_item.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class HomeStoriesList extends StatelessWidget {
  const HomeStoriesList({super.key, required this.state});
  final ReadingLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categories(),
        Expanded(
          child: ListView.separated(
            itemCount: state.stories.length,
            padding: AppPadding.defaults,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              var story = state.stories[index];

              return StoryListItem(story: story, showLevel: true);
            },
          ),
        ),
      ],
    );
  }
}
