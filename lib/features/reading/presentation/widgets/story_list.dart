import 'package:english_will_fly/core/constants/app_size.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_list_item.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key, required this.state});
  final ReadingLoaded state;

  @override
  Widget build(BuildContext context) {
    var sortedStories =
        List.from(state.filteredStories); // Orijinal listeyi korumak istersen kopyala
    sortedStories.sort((a, b) => a.id.compareTo(b.id)); // Alfanümerik sıralama

    return OrientationBuilder(
      builder: (context, ori) {
        return GridView.builder(
          gridDelegate: AppSize.gridDelegate(ori),
          padding: AppPadding.defaults,
          itemCount: sortedStories.length,
          itemBuilder: (context, index) {
            return StoryListItem(story: sortedStories[index]);
          },
        );
      },
    );
  }
}
