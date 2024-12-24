import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/info_box.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/text_to_speech_button.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.isDark ? AppColor.storyDetailDark : AppColor.storyDetail,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoBox(title: "home.level", value: story.level.toUpperCase(), icon: Icons.analytics),
          GestureDetector(
            onTap: () => context.push("/wordList", extra: story.definitions),
            child: InfoBox(
              title: "home.newWords",
              value: story.definitions.length.toString(),
              icon: Icons.add_home_rounded,
            ),
          ),
          TextToSpeechButton(text: story.paragraphs.join(". ")),
        ],
      ),
    );
  }
}
