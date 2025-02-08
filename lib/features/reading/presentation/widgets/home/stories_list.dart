import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_list_item.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class HomeStoriesList extends StatelessWidget {
  const HomeStoriesList({super.key, required this.state});
  final ReadingLoaded state;

  @override
  Widget build(BuildContext context) {
    double mainAxisSpacing = 16;

    return GridView.builder(
      itemCount: state.stories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: mainAxisSpacing,
        childAspectRatio: 3 / 5.2,
      ),
      padding: AppPadding.defaults16,
      itemBuilder: (context, index) {
        return StoryListItem(story: state.stories[index], showLevel: true);
      },
    );
  }
}
