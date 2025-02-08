import 'package:english_will_fly/features/reading/presentation/widgets/story_detail/story_detail_chapters.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail_item.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_like_button.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/text_to_speech_button.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.storyDetailPanel,
      decoration: BoxDecoration(
        color: context.color.surface,
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, -1),
            blurRadius: 1,
            color: context.color.surfaceContainerLow,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StoryLikeButton(),
          StoryDetailItem(
            icon: Icons.bookmark_border_rounded,
            tooltip: "Kitaplığa Ekle",
            onTap: () => print("Kitaplığa"),
          ),
          StoryDetailChapters(),
          TextToSpeechButton(),
          StoryDetailItem(
            icon: Icons.more_horiz_outlined,
            tooltip: "Daha Fazla",
            onTap: () => print("Daha Fazla"),
          ),
        ],
      ),
    );
  }
}
