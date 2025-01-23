import 'package:english_will_fly/features/reading/data/models/chapter.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_image.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StoryChapterSection extends StatelessWidget {
  const StoryChapterSection({super.key, required this.story, required this.chapter});
  final Story story;
  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        chapter.id == 1 ? StoryImage(story: story) : SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            "Chapter ${chapter.id}",
            style: context.text.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          chapter.title,
          style: context.text.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
