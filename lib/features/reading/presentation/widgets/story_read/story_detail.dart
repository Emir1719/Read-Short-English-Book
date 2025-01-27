import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail_item.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_like_button.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/text_to_speech_button.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.isDark ? AppColor.storyDetailDark : AppColor.storyDetail,
      padding: AppPadding.storyDetailPanel,
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
          StoryDetailItem(
            icon: Icons.menu_rounded,
            tooltip: "Bölümler",
            onTap: () => print("Bölümler"),
          ),
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
