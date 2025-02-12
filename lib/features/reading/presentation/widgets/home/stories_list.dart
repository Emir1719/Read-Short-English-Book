import 'package:english_will_fly/core/constants/app_size.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_list_item.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class HomeStoriesList extends StatelessWidget {
  const HomeStoriesList({super.key, required this.state});
  final ReadingLoaded state;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, ori) {
        return GridView.builder(
          itemCount: state.stories.length,
          gridDelegate: AppSize.gridDelegate(ori),
          padding: AppPadding.defaults,
          itemBuilder: (context, index) {
            return StoryListItem(story: state.stories[index], showLevel: true);
          },
        );
      },
    );
  }
}
