import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_item_image.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_item_subtitle.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StoryListItem extends StatelessWidget {
  const StoryListItem({super.key, required this.story, this.showLevel = false});
  final Story story;
  final bool showLevel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final analytics = FirebaseAnalytics.instance;
        await analytics.logEvent(name: "story_read");

        if (!context.mounted) return;

        context.read<StoryReadBloc>().add(LoadStory(story: story));
        context.push("/read");
      },
      child: Container(
        decoration: AppStyle.level,
        child: Row(
          children: [
            StoryItemImage(story: story, showLevel: showLevel),
            Expanded(
              child: Padding(
                padding: AppPadding.storyItem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    _title(context),
                    StoryItemSubtitle(story: story),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      story.title,
      style: textTheme.titleMedium,
      maxLines: 1,
    );
  }
}
