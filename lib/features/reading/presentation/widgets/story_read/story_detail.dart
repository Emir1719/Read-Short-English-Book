import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail_item.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_like_button.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/text_to_speech_button.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.isDark ? AppColor.storyDetailDark : AppColor.storyDetail,
      padding: AppPadding.storyDetailPanel,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StoryLikeButton(story: story),
          StoryDetailItem(
            icon: Icons.bookmark_border_rounded,
            tooltip: "Favoriye Ekle",
            onTap: () => print("Favoriye"),
          ),
          StoryDetailItem(
            icon: Icons.share_outlined,
            tooltip: "Paylaş",
            onTap: () => print("Paylaş"),
          ),
          TextToSpeechButton(text: story.paragraphs.join(". ")),
        ],
      ),
    );
  }
}
