import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryLikeButton extends StatelessWidget {
  const StoryLikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReadingBloc>();
    final bloc2 = context.read<StoryReadBloc>().state as StoryReadLoaded;

    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        Story story = bloc2.story;
        story.isLiked = bloc.getStoryById(story.id).isLiked;

        return StoryDetailItem(
          icon: story.isLiked ? Icons.favorite_outlined : Icons.favorite_outline_rounded,
          tooltip: "Beğen",
          onTap: () {
            bloc.add(StoryToggleLiked(
              storyId: story.id.toString(),
              levelCode: story.level.toLowerCase(),
            ));
          },
        );
      },
    );
  }
}
