import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_item_image.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_item_subtitle.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoryListItem extends StatelessWidget {
  const StoryListItem({super.key, required this.story, this.showLevel = false});
  final Story story;
  final bool showLevel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/read", extra: story),
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
                  children: [
                    _title(context),
                    const SizedBox(height: 5),
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
