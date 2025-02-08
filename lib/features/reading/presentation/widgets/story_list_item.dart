import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_detail_base.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_item_image.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_title.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
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
        context.push("/intro");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: context.color.surfaceContainerLow),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            StoryItemImage(story: story),
            StoryTitle(title: story.title),
            Row(
              children: [
                StoryDetailBase(
                  child: Text(story.level.toUpperCase(), style: context.text.bodySmall),
                ),
                StoryDetailBase(
                  child: Text(story.category.title, style: context.text.bodySmall).tr(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
